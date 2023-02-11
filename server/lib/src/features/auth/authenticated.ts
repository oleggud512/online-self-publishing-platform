import { NextFunction, Request, Response } from 'express';
// import * as admin from 'firebase-admin';
import { getAuth } from 'firebase-admin/auth';

// export async function isAuthenticated(req: Request, res: Response, next: Function) {
//   const { authorization } = req.headers;
//   console.log(`Authenticating from ${req.baseUrl}`)
  
//   if (!authorization)
//        return res.status(401).send({ error: true, message: 'There is no authorization' });

//   if (!authorization.startsWith('Bearer'))
//       return res.status(401).send({ error: true, message: 'authorization is not starting with Bearer' });

//   const split = authorization.split(' ');
//   if (split.length !== 2)
//       return res.status(401).send({ error: true, message: `split.length != 2. split.length = ${split.length}` });

//   const token = split[1];
//   console.log(`THERE IS A TOKEN ${token}`)
//   try {
//     console.log(`i want to verify token now`);
//     const decodedToken = await getAuth().verifyIdToken(token);
//     console.log("token successfully verified, decodedtoken: ", JSON.stringify(decodedToken))
//     res.locals = {
//       ...res.locals,
//       uid: decodedToken.uid, // id of the user
//       role: decodedToken.role, 
//       email: decodedToken.email // email of the user
//     };
//     return next();
//   } catch (err) {
//     res.status(403).send({ error: true, message: err });
//     throw err
//     console.log(`isAuthenticated ====- ${err}`);
//   }
// }

export async function isAuthenticated(req: Request, res: Response, next: Function) {
  const { authorization } = req.headers;
  console.log(`Authenticating from ${req.baseUrl}`)
  
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

// не будет ошибки если он не авторизован, но если авторизован то хорошо.
export async function couldBeAuthenticated(req: Request, res: Response, next: NextFunction) {
  const { authorization } = req.headers

  if (!authorization) {
    console.warn('not authenticated')
    return next()
  }

  try {
    const authResult = await checkAuth(authorization)
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
async function checkAuth(authorization: string) : Promise<AuthResult> {
  if (!authorization.startsWith('Bearer'))
    throw { error: true, message: 'authorization is not starting with Bearer' }

  const split = authorization.split(' ')

  if (split.length !== 2)
    throw{ error: true, message: `split.length != 2. split.length = ${split.length}` }

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