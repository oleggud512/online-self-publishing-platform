import { Interceptor } from "aurelia-fetch-client";
import * as auth from "firebase/auth"

export class AuthInterceptor implements Interceptor {
  async request(request: Request) : Promise<Request | Response> {
    const authorization = await auth.getIdToken(auth.getAuth().currentUser)
    request.headers.append('authorization', `Bearer ${authorization}`)
    return request
  }
}