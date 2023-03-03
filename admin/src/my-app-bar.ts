import * as auth from "firebase/auth"
import { Router } from "aurelia-router"
import { inject } from "aurelia-framework"

@inject(Router)
export class MyAppBar {
  constructor(private router: Router) { }

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