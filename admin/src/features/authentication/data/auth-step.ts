import { PipelineStep, NavigationInstruction, Next, Redirect } from "aurelia-router"
import { autoinject } from 'aurelia-framework'
import { Router } from 'aurelia-router'
import * as auth from "firebase/auth"
import { MyRoute } from "router"

@autoinject
export class AuthStep implements PipelineStep {
  private redirected = false
  private user: auth.User

  s() {
    auth.onAuthStateChanged(auth.getAuth(), async (u) => {
      console.log('authStateChanged')
      console.log(u)
      console.log(auth.getAuth().currentUser)
      if (!u) return this.router.navigateToRoute(MyRoute.auth, {}, { replace: true })

      const token = await auth.getIdTokenResult(u)
      const role = token.claims.role

      if (['admin', 'super-admin'].includes(role)) {
        if ([MyRoute.home, MyRoute.auth].includes(this.router.currentInstruction.config.name)) {
          this.router.navigateToRoute(MyRoute.reports, {}, { replace: true })
        }
        return 
      }
      this.router.navigateToRoute(MyRoute.nonAdmin, {}, { replace: true })
    })
  }
  constructor(private router: Router) {
    this.s()
  }

  public async run(navigationInstruction: NavigationInstruction, next: Next): Promise<any> {
    var currentRoute = navigationInstruction.config.name

    if (this.redirected) {
      console.log('this.redirected')
      this.redirected = false
      return next()
    }


    const a = auth.getAuth()
    
    console.log('check auth')
    console.log(a.currentUser)
    
    if (!a.currentUser) {
      console.log('no user')
      this.redirected = true;
      return next.cancel(new Redirect(this.router.generate(MyRoute.auth)))
    }

    console.log('check auth | user')

    const token = await auth.getIdTokenResult(a.currentUser)
    const role = token.claims.role

    if (['admin', 'super-admin'].includes(role)) {
      if ([MyRoute.home, MyRoute.auth].includes(currentRoute)) {
        return next.cancel(new Redirect(this.router.generate(MyRoute.reports)))
      }
      return next()
    }

    console.log('check auth | non-admin')
    this.redirected = true
    return next.cancel(new Redirect(this.router.generate(MyRoute.nonAdmin)))
  }
}