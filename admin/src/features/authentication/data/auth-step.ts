import { PipelineStep, NavigationInstruction, Next, Redirect } from "aurelia-router"
import { autoinject } from 'aurelia-framework'
import { Router } from 'aurelia-router'
import * as auth from "firebase/auth"
import { MyRoute } from "router"

@autoinject
export class AuthStep implements PipelineStep {
  private redirected = false
  private user: auth.User

  private authStateChangedPromise: Promise<void>
  private authStateChangedResolve: () => void

  constructor(private router: Router) {
    this.authStateChangedPromise = new Promise<void>((resolve) => {
      this.authStateChangedResolve = resolve
    })
    this.listenAuth()
  }

  listenAuth() {
    auth.onAuthStateChanged(auth.getAuth(), async (u) => {
      this.authStateChangedResolve()
      if (!u) return this.router.navigateToRoute(MyRoute.auth, {}, { replace: true })

      const token = await auth.getIdTokenResult(u)
      const role = token.claims.role

      if (['admin', 'super-admin'].includes(role)) {
        if ([MyRoute.home, MyRoute.auth].includes(this.router.currentInstruction.config.name)) {
          console.log('listener: admin')
          this.router.navigateToRoute(this.routeToNavigate?.config.name ?? MyRoute.reports, this.routeToNavigate?.params, { replace: true })
          this.routeToNavigate = undefined
        }
        return 
      }
      console.log('listener: no admin')
      this.router.navigateToRoute(MyRoute.nonAdmin, {}, { replace: true })
    })
  }

  routeToNavigate?: NavigationInstruction

  public async run(navigationInstruction: NavigationInstruction, next: Next): Promise<any> {
    await this.authStateChangedPromise
    var currentRoute = navigationInstruction.config.name

    if (![MyRoute.home, MyRoute.auth, MyRoute.nonAdmin].includes(currentRoute)) {
      this.routeToNavigate = navigationInstruction
    }

    console.log(`currentRouteStep: ${currentRoute}`)
    if (this.redirected) {
      console.log('this.redirected')
      this.redirected = false
      return next()
    }


    const a = auth.getAuth()
    
    console.log('step: check user')
    
    if (!a.currentUser) {
      console.log('no user')
      this.redirected = true;
      return next.cancel(new Redirect(this.router.generate(MyRoute.auth)))
    } else {
      console.log(a.currentUser)
    }

    console.log('step: check role')

    const token = await auth.getIdTokenResult(a.currentUser)
    const role = token.claims.role

    if (['admin', 'super-admin'].includes(role)) {
      if ([MyRoute.home, MyRoute.auth].includes(currentRoute)) {
        console.log('step: admin')
        const n = next.cancel(new Redirect(this.router.generate(this.routeToNavigate?.config.name ?? MyRoute.reports, this.routeToNavigate?.params)))
        this.routeToNavigate = undefined
        return n
      }
      return next()
    }

    console.log('step: no admin')
    this.redirected = true
    return next.cancel(new Redirect(this.router.generate(MyRoute.nonAdmin)))
  }
}


