import { Request, Response } from "express";
import { Role } from "../users/models/Role";

/**
 * используется только в паре с isAutenticated 
 * @param allowSameUser если 
 */
export function isAuthorized(opts: { 
  hasRole: Array<Role>, 
  allowSameUser?: boolean 
}) {
  return (req: Request, res: Response, next: Function) => {
    const { role, email, uid } = res.locals; // тут беру uid из isAuthenticated
    
    // костыль. Нужен потому что console.firebase.com не позволяет 
    // устанавливать customClaims. 
    if (email == 'user3@gmail.com') {
      console.log("I will allow oleggud52@gmail.com to do everything he want to do.")
      return next();
    }
    // типа для себя? "Если я хочу обратиться к собственному юзеру то РАЗРЕШИТЬ"
    // но такая функция доступна только если allowSameUser == true. 
    // если false то если ты захочешь редактировать себя то тебе не разрешат. 
    if (opts.allowSameUser && req.params.uid && uid === req.params.uid) { 
      return next();
    }
    if (!role){ 
      return res.status(403).send({ error: true, message: "isAuthorized: no role" });
    }
    if (opts.hasRole.includes(role)) {
      return next();
    }
  }
}