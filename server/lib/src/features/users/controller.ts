import { Request, Response, NextFunction } from "express"
import { FireUser } from "./models/FireUser"
import * as service from "./service"
import { guard } from "../../common/handle-error"
import { promise } from "../../common/error-handling"


export async function createUser(req: Request, res: Response) {
  await guard(res, async () => {
    const { displayName, password, email, role } = req.body

    if (!displayName || !password || !email || !role) {
      return res.status(400).json({message: 'Missing fields'})
    }

    const user: FireUser = await service.createUser({displayName, password, email, role});

    return res.status(201).json({ user })
  })
}

export async function getUsers(req: Request, res: Response) {
  await guard(res, async () => {
    const users = await service.getUsers()
    return res.json({error: false, data: users})
  })
}

export async function getUser(req: Request, res: Response) {
  await guard(res, async () => {
    const { uid } = req.params
    const user = await service.getUser(uid)
    return res.json({error: false, data: user})
  })
}

export async function updateUser(req: Request, res: Response) {
  await guard(res, async () => {
    const { uid } = req.params
    const updates = req.body

    if ((updates.role || updates.allowComment || updates.allowPublish) 
        && res.locals.role != 'super-admin' 
        && res.locals.email != "oleggud52@gmail.com") {
      return res.json({error: true, message: "only super admin can edit 'role', 'allowComment', 'allowPublish'"})
    }

    const updatedUser = await service.updateUser(uid, updates)
    return res.json({error: false, data: updatedUser})
  })
}

export async function deleteUser(req: Request, res: Response) {
  await guard(res, async () => {
    const { uid } = req.params
    await service.deleteUser(uid)
    return res.json({error: false, data: uid})
  })
}

export async function isAdmin(req: Request, res: Response) {
  await guard(res, async () => {
    console.log("IS ADMIN ROUTE")
    const { email } = req.query
    console.log(`i want to verifiy this email - ${email}`)
    if (!email) return res.status(500).json({error: true, message: `No email`})
    const isAdmin = await service.isAdmin(email as string)
    console.log(`email ${email} isAdmin=${isAdmin}`)
    return res.json({
      error: false,
      data: isAdmin
    });
  })
}


export async function toggleBlocked(req: Request, res: Response, next: NextFunction) {
  const targetId = req.params.uid
  const adminId = res.locals.uid
  const before = req.query.before
    ? new Date(req.query.before as string)
    : undefined

  const [blocked, error] = await promise(service.toggleBlocked(targetId, adminId, before))

  if (error) return next(error)

  return res.json({ data: blocked })
}


export async function isBlocked(req: Request, res: Response, next: NextFunction) {
  const profileId = req.params.uid

  const [blocked, error] = await promise(service.isBlocked(profileId))

  if (error) return next(error)

  return res.json({ data: blocked })
}