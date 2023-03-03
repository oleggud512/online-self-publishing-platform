import * as auth from "firebase/auth"

export class NonAdminScreen {
  signOut() {
    auth.signOut(auth.getAuth())
  }

  public get email() {
    return auth.getAuth().currentUser.email
  }
}