import { NextFunction, Request, Response } from "express"
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
  const { query, limit, from, age, gender } = req.query

  // Perform any necessary parsing or validation here
  const parsedLimit = limit ? parseInt(limit as string, 10) : 20
  const parsedAge = age ? parseInt(age as string, 10) : undefined
  const parsedGender = gender as Gender

  // Perform any other logic here

  // Return the result
  return res.status(200).json({
    query,
    parsedLimit,
    from,
    parsedAge,
    parsedGender
  })
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

  if (res.locals.uid != req.body._id) return res.status(500).json({error: "you can't update other's profiles."}) 

  const profile = await profileService.updateProfile(req.body);

  return res.status(200).json({ data: profile })
}