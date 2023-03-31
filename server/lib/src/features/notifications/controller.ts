import { Request, Response, NextFunction } from 'express'
import { promise } from '../../common/error-handling'
import * as notificationService from "./service"

export async function syncToken(req: Request, res: Response, next: NextFunction) {
  const profileId = res.locals.uid
  const token = req.body.token

  const [updated, error] = await promise(notificationService.syncToken(profileId, token))

  if (error) return next(error)
  return res.json({ data: updated })
}