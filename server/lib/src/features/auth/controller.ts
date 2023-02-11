import { NextFunction, Request, Response } from "express";
import * as admin from "firebase-admin"
import { OAuth2Client } from "google-auth-library";
import constants from "../../common/firebase_constants"
import isFirebaseError from "../../common/is_firebase_error";

import { IProfile, Profile } from "../profiles/Profile";
import * as profileService from "../profiles/service";

class AppError extends Error {
  constructor(message: string, public code: number) {
    super(message);
  }
}

export async function signUpWithGoogle(req: Request, res: Response) {
  const idToken = req.body.idToken;
  const accessToken = req.body.accessToken;

  const name = req.body.name;
  const displayName = req.body.displayName;
  const age = req.body.age;
  const gender = req.body.gender;
  
  // const decodedToken = await admin.auth().verifyIdToken(idToken);
  // const uid = decodedToken.uid;
  // const email = decodedToken.email!;

  const client = new OAuth2Client(constants.CLIENT_ID);
  const ticket = await client.verifyIdToken({
    idToken: idToken,
    audience: constants.CLIENT_ID
  })
  const uid = ticket.getUserId()!
  const payload = ticket.getPayload()!
  const email = payload.email!
  
  // Create a Firebase user
  const userRecord = await admin.auth().createUser({
    email,
    displayName,
    providerToLink: {
      uid,
      email,
      photoURL: payload.picture!,
      providerId: "google.com"
    }
  });
  console.log("Successfully created new Firebase user:", userRecord.toJSON());
  // Store the user data in a MongoDB database
  const profile = await profileService.createProfile({
    _id: userRecord.uid,
    email, 
    name,
    displayName,
    age,
    gender
  })
  console.log(`Successfully saved user data to MongoDB. ${JSON.stringify(profile)}`);

  // Respond with the Firebase ID token and access token
  res.json({
    data: {
      idToken,
      accessToken,
      _id: uid,
      name,
      displayName,
      age,
      gender,
    },
  });
}

export async function signUpWithEmailAndPassword(req: Request, res: Response, next: NextFunction) {
  const email = req.body.email;
  const password = req.body.password;

  const name = req.body.name;
  const displayName = req.body.displayName;
  const age = req.body.age;
  const gender = req.body.gender;

  try {
    const record = await admin.auth().createUser({
      email,
      password,
      displayName,
    })
    const profile = await profileService.createProfile({
      _id: record.uid,
      email, 
      name,
      displayName,
      age,
      gender
    })
    console.info(`new profile created: ${profile}`)
    const customToken = await admin.auth().createCustomToken(record.uid)
    res.status(200).json({ data: { ...profile, customToken } })
  } catch (e) {
    if (isFirebaseError(e)) {
      next(new AppError("incorrect-password", 500))
      return
    }
    next(e)
  }
}