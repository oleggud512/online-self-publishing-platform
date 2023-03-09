import * as auth from "firebase/auth"
import { Router, RouterConfiguration, NavigationInstruction } from "aurelia-router"
import { inject } from "aurelia-framework"
import i18next from "i18next";
import { SegmentButton } from "components/segmented-buttons/segment-button";

@inject(Router)
export class MyAppBar {
  public t = i18next.t

  public curLocale = i18next.language

  public localizationSegments: SegmentButton[] = [
    {
      value: 'en',
      displayName: this.t("english")
    },
    {
      value: 'uk',
      displayName: this.t("ukrainian")
    }
  ]

  onNewLocale(newLocale: string) {
    console.log(newLocale)
    i18next.changeLanguage(newLocale).then(newT => {
      this.t = newT
      localStorage.setItem('curLocale', newLocale)
      const reload = confirm(this.t('reloadNow'))
      if (reload) {
        window.location.reload()
      }
    })
  }

  onNewRouteCallback = this.onNewLocale.bind(this)

  constructor(private router: Router) { }

  activate(params, routerConfig: RouterConfiguration, inst: NavigationInstruction) {
    
  }

  signOut() {
    auth.signOut(auth.getAuth());
  }

  get username() : string {
    const user = auth.getAuth().currentUser

    return user.email
  }

  get isSignedIn() : boolean {
    return Boolean(auth.getAuth().currentUser)
  }
}