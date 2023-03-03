import * as auth from "firebase/auth"

export class AuthScreen {
  
  async signInWithGoogle() {
    const a = auth.getAuth()
    const creds = await auth.signInWithPopup(a, new auth.GoogleAuthProvider())
    console.log(creds)
  }
  
}