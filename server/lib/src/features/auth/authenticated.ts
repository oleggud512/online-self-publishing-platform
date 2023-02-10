import { Request, Response } from 'express';
// import * as admin from 'firebase-admin';
import { getAuth } from 'firebase-admin/auth';


export async function isAuthenticated(req: Request, res: Response, next: Function) {
  const { authorization } = req.headers;
  console.log(`Authenticating from ${req.baseUrl}`)
  
  if (!authorization)
       return res.status(401).send({ error: true, message: 'There is no authorization' });

  if (!authorization.startsWith('Bearer'))
      return res.status(401).send({ error: true, message: 'authorization is not starting with Bearer' });

  const split = authorization.split(' ');
  if (split.length !== 2)
      return res.status(401).send({ error: true, message: `split.length != 2. split.length = ${split.length}` });

  const token = split[1];
  console.log(`THERE IS A TOKEN ${token}`)
  try {
    console.log(`i want to verify token now`);
    const decodedToken = await getAuth().verifyIdToken(token);
    console.log("token successfully verified, decodedtoken: ", JSON.stringify(decodedToken))
    res.locals = {
      ...res.locals,
      uid: decodedToken.uid, // id of the user
      role: decodedToken.role, 
      email: decodedToken.email // email of the user
    };
    return next();
  } catch (err) {
    res.status(403).send({ error: true, message: err });
    throw err
    console.log(`isAuthenticated ====- ${err}`);
  }
}