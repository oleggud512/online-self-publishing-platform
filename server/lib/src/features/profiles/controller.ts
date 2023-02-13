import { NextFunction, Request, Response } from "express"
import { tryParseInt } from "../../common/tryParseInt"
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
  const { query, limit, from } = req.query

  const parsedLimit = limit ? parseInt(limit as string, 10) : 20
  const parsedFrom = from ? parseInt(from as string) : 0

  const profiles = await profileService.getProfiles(
    query as string, 
    parsedLimit, 
    parsedFrom,
    res.locals.uid
  )
  return res.status(200).json({ data: profiles })
}

export async function getProfile(req: Request, res: Response, next: NextFunction) {
  const { id } = req.params
  profileService.getProfile(id as string)
    .then(profile => {
      res.status(200).json({data: profile})
    }).catch(next)
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

export async function subscribe(req: Request, res: Response) {
  const to = req.params.id as string
  console.info(`subscribe to ${to}`)
  const isSubscribed = await profileService.subscribe(res.locals.uid!, to)
  return res.status(200).json({ data: isSubscribed })
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

export async function subscribers(req: Request, res: Response) {
  const id = req.params.id as string
  const from = tryParseInt(req.query.from as string | undefined) ?? 0
  const pageSize = tryParseInt(req.query.pageSize as string | undefined) ?? 20

  const subscriptions = await profileService.subscribers(id, from, pageSize)

  return res.status(200).json({ 
    from: from,
    pageSize: pageSize,
    data: subscriptions 
  }) 
}

export async function subscriptions(req: Request, res: Response) {
  const id = req.params.id as string
  const from = tryParseInt(req.query.from as string | undefined) ?? 0
  const pageSize = tryParseInt(req.query.pageSize as string | undefined) ?? 20

  const subscriptions = await profileService.subscriptions(id, from, pageSize)

  return res.status(200).json({ 
    from: from,
    pageSize: pageSize,
    data: subscriptions 
  }) 
}