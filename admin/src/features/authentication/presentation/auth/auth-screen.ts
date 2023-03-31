import * as auth from "firebase/auth"

export class AuthScreen {
  password: string
  email: string
  
  async signInWithGoogle() {
    const a = auth.getAuth()
    const creds = await auth.signInWithPopup(a, new auth.GoogleAuthProvider())
    console.log({google: creds})
  }

  async signInWithEmailAndPassword() {
    const a = auth.getAuth()
    const creds = await auth.signInWithEmailAndPassword(a, this.email, this.password)
    console.log({emailAndPassword: creds})
  }
  
}