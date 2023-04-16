import { NextFunction, Request, Response } from 'express';
// import admin from 'firebase-admin';
import admin from 'firebase-admin';
import { Socket } from 'socket.io';
import { AppError } from '../../common/app-error';
import { AppErrors } from '../../shared/errors';
import { Role } from '../users/models/Role';
import { AuthResult } from './AuthResult';


export async function isAuthenticated(req: Request, res: Response, next: Function) {
  const { authorization } = req.headers;
  console.log(`Authenticating from ${req.baseUrl}`)
  console.log(`authorization = ''${authorization}''`)
  
  if (!authorization) return next(new AppError(AppErrors.invalidAuth))

  try {
    const authResult = await checkAuth(authorization)
    res.locals = {
      ...res.locals,
      ...authResult
    }
    console.log({'isAuthenticated: token verified. res.locals': res.locals})
    next()
  } catch (e) {
    console.error(e)
    return next(e)
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
    console.error('^^^ error from isAuthenticatedSocket ^^^')
    next(error)
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
    return next()
  } catch (e) {
    return next(e)
  }
  // check authorization by all of the rules
}

// просто проверяет, авторизован ли.
// если авторизован, то возвращает uid, role, email
// если не авторизован, выбрасывает ошибку, с текстом, шо не так. 
export async function checkAuth(authorization: string) : Promise<AuthResult> {
  try {
    const token = _validateAuthorization(authorization)
    
    const decodedToken = await admin.auth().verifyIdToken(token);
    console.log({'decoded token': decodedToken})
    if (decodedToken.role == 'blocked' as Role) {
      throw new AppError(AppErrors.blockedUserAuth)
    }
    const result = {
      uid: decodedToken.uid,
      role: decodedToken.role, 
      email: decodedToken.email as string
    } as AuthResult
    console.log("token successfully verified, decodedtoken: ", JSON.stringify(result))
    return result

  } catch (err) {
    console.log('unauthenticated...........')
    throw err
  }
}


function _validateAuthorization(authorization: string) {
  if (!authorization.startsWith('Bearer')) {
    throw new AppError(
      AppErrors.invalidAuth, 
      'authorization is not starting with Bearer'
    )
  }

  const split = authorization.split(' ')

  if (split.length !== 2) {
    throw new AppError(
      AppErrors.invalidAuth, 
      `split.length != 2. split.length = ${split.length}`
    )
  }

  const token = split[1];
  return token
}
