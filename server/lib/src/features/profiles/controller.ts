import { NextFunction, Request, Response } from "express"
import { promise } from "../../common/error-handling"
import { parsePaginationQuery } from "../../common/parse-pagination-query"
import { tryParseInt } from "../../common/tryParseInt"
import { Role } from "../users/models/Role"
import { CannotSubscribeYourself } from "./errors"
import { Gender } from "./Profile"
import * as profileService from "./service"


export async function addProfile(req: Request, res: Response) {
  const { _id, email, name, displayName, age, gender } = req.body

  // Perform any necessary parsing or validation here
  const parsedAge = age ? parseInt(age, 10) : undefined

  const createdProfile = await profileService.createProfile({
    _id: _id,
    email: email,
    name: name,
    displayName: displayName,
    age: parsedAge!,
    gender: gender
  })

  // Return the result
  return res.status(200).json({error: false, data: createdProfile})
}


export async function getProfiles(req: Request, res: Response) {
  const { query } = req.query
  const { from, pageSize } = parsePaginationQuery(req.query)

  const profiles = await profileService.getProfiles(
    query as string, 
    from,
    pageSize, 
    res.locals.uid
  )
  return res.status(200).json({ data: profiles })
}


export async function getProfile(
  req: Request, 
  res: Response, 
  next: NextFunction
) {
  console.log(`getProfile(${req.params})`)
  const { id } = req.params
  const forProfile = res.locals.uid

  const isAdmin = res.locals.role && 
    (['admin', 'super-admin'] as Role[]).includes(res.locals.role)

  const [profile, error] = await promise(
    isAdmin 
      ? profileService.getProfileForAdmin(id, forProfile)
      : profileService.getProfile(id, forProfile)
  )

  if (error) return next(error)

  return res.json({ data: profile })
}


export async function isUniqueName(req: Request, res: Response) {
  const name = req.query.name as string
  const uid = req.query.uid as string
  return res.status(200).json({ data: await profileService.isUniqueName(name, uid) })
}


export async function updateProfile(req: Request, res: Response) {
  console.log(`who: ${res.locals.email} ${res.locals.uid}`)
  console.log(`tries to update who: ${req.body.email} ${req.body._id}`)

  if (res.locals.uid != req.body._id) 
    return res.status(500).json({error: "you can't update other's profiles."}) 

  const profile = await profileService.updateProfile(req.body);

  return res.status(200).json({ data: profile })
}


export function subscribe(req: Request, res: Response, next: NextFunction) {
  const to = req.params.id as string
  console.info(`subscribe to ${to}`)
  
  if (res.locals.uid! === to) return next(new CannotSubscribeYourself())

  profileService.subscribe(res.locals.uid!, to).then(isSubscribed => {
    res.status(200).json({ data: isSubscribed })
  })
}


export async function unsubscribe(req: Request, res: Response) {
  const to = req.params.id as string
  const isUnsubscribed = await profileService.unsubscribe(res.locals.uid!, to)
  return res.status(200).json({ data: isUnsubscribed })
}


export async function isSubscribed(req: Request, res: Response) {
  const to = req.params.id as string
  const isSubscribed = await profileService.isSubscribed(res.locals.uid!, to)
  return res.status(200).json({ data: isSubscribed })
}


export async function getSubscribers(req: Request, res: Response) {
  const id = req.params.id as string
  const from = tryParseInt(req.query.from as string | undefined) ?? 0
  const pageSize = tryParseInt(req.query.pageSize as string | undefined) ?? 20

  const subscriptions = await profileService.getSubscribers(id, from, pageSize)

  return res.status(200).json({ 
    from: from,
    pageSize: pageSize,
    data: subscriptions 
  }) 
}


export async function getSubscriptions(req: Request, res: Response) {
  const id = req.params.id as string
  const from = tryParseInt(req.query.from as string | undefined) ?? 0
  const pageSize = tryParseInt(req.query.pageSize as string | undefined) ?? 20

  const subscriptions = await profileService.getSubscriptions(id, from, pageSize)

  return res.status(200).json({ 
    from: from,
    pageSize: pageSize,
    data: subscriptions 
  }) 
}


export async function addBookmarks(req: Request, res: Response) {
  const forProfile = req.params.id as string
  const newBookmarks = req.body.bookmarks as string[]

  if (!forProfile || !res.locals.uid || forProfile != res.locals.uid) {
    return res.status(401).json({ data: false })
  }

  const added = await profileService.addBookmarks(forProfile, newBookmarks);

  return res.json({ data: added })
}


export async function getBookmarks(req: Request, res: Response, next: NextFunction) {
  const { from, pageSize } = parsePaginationQuery(req.query)
  const bookmarks = await profileService.getBookmarks(res.locals.uid, from, pageSize);
  return res.json({ data: bookmarks })
}


export async function getPermissions(req: Request, res: Response, next: NextFunction) {
  const profileId = req.params.id

  const [permissions, error] = await promise(profileService.getPermissions(profileId))
  
  if (error) return next(error)
  console.log({permissions})
  return res.json({ data: permissions })
}


export async function togglePublish(req: Request, res: Response, next: NextFunction) {
  const profileId = req.params.id
  const adminId = res.locals.uid

  const before = req.query.before 
    ? new Date(req.query.before as string)
    : undefined

  const [publish, error] = await promise(profileService.togglePublishBook(profileId, adminId, before));

  if (error) return next(error)
  return res.json({ data: publish })
}


export async function toggleComment(req: Request, res: Response, next: NextFunction) {
  const profileId = req.params.id
  const adminId = res.locals.uid

  const before = req.query.before 
    ? new Date(req.query.before as string)
    : undefined

  console.log(req.query.before)

  const [comment, error] = await promise(profileService.toggleAddComment(profileId, adminId, before));

  if (error) return next(error)
  return res.json({ data: comment })
}