import { NextFunction, Request, Response } from 'express';
// import * as admin from 'firebase-admin';
import { getAuth } from 'firebase-admin/auth';
import { Socket } from 'socket.io';
import { AppError } from '../../common/app-error';


export async function isAuthenticated(req: Request, res: Response, next: Function) {
  const { authorization } = req.headers;
  console.log(`Authenticating from ${req.baseUrl}`)
  console.log(`authorization = ''${authorization}''`)
  
  if (!authorization)
       return res.status(401).send({ error: true, message: 'There is no authorization' });

  try {
    const authResult = await checkAuth(authorization)
    res.locals = {
      ...res.locals,
      ...authResult
    }
    console.log(res.locals)
    next()
  } catch (e) {
    console.error(e)
    return res.status(403).send(e)
  }
}

export async function isAuthenticatedSocket(socket: Socket, next: Function) {
  try {
    const authorization = socket.handshake.auth.authorization;

    console.log(`SOCKET AUTH - ${authorization}`)

    if (!authorization) 
      throw new AppError('auth-error')

    const authResult = await checkAuth(authorization)
    socket.handshake.auth = {
      ...socket.handshake.auth,
      ...authResult
    }
    console.log(`authenticated: ${JSON.stringify(authResult)}`)
    next()
  } catch (error) {
    // If there is an error, send an error message to the client
    console.error(error);
    console.error('^^^ error from isAuthenticated socket ^^^')
    socket.emit("error", "Failed to authenticate user");
  }
}

// не будет ошибки если он не авторизован, но если авторизован то хорошо.
export async function couldBeAuthenticated(req: Request, res: Response, next: NextFunction) {
  const { authorization } = req.headers

  console.warn('COULD BE AUTHENTICATED')
  if (!authorization) {
    console.warn('not authenticated')
    return next()
  }

  try {
    const authResult = await checkAuth(authorization)
    console.log('authResult')
    console.log(authResult)
    res.locals = {
      ...res.locals,
      ...authResult
    }
    next()
  } catch (e) {
    next()
  }
  // check authorization by all of the rules
}

export type AuthResult = { uid: string, role: string, email: string }
// просто проверяет, авторизован ли.
// если авторизован, то возвращает uid, role, email
// если не авторизован, выбрасывает ошибку, с текстом, шо не так. 
export async function checkAuth(authorization: string) : Promise<AuthResult> {
  if (!authorization.startsWith('Bearer'))
    throw { error: true, message: 'authorization is not starting with Bearer' }

  const split = authorization.split(' ')

  if (split.length !== 2)
    throw { error: true, message: `split.length != 2. split.length = ${split.length}` }

  const token = split[1];
  console.log(`THERE IS A TOKEN ${token}`)
  try {
    console.log(`i want to verify token now`);
    const decodedToken = await getAuth().verifyIdToken(token);
    console.log("token successfully verified, decodedtoken: ", JSON.stringify(decodedToken))
    return {
      uid: decodedToken.uid,
      role: decodedToken.role, 
      email: decodedToken.email as string
    }
  } catch (err) {
    throw { error: true, message: err }
  }
}