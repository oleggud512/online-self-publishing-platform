import axios from "axios";
import { NextFunction, Request, Response } from "express";
import * as admin from "firebase-admin"
import * as auth from "firebase/auth"
import { OAuth2Client } from "google-auth-library";
import constants from "../../../firebase-constants"
import isFirebaseError from "../../common/is-firebase-error";

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


export async function signInWithEmailAndPassword(req: Request, res: Response, next: NextFunction) {
  const email = req.body.email;
  const password = req.body.password;

  const resp = await axios.post(`https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyBQx-7ZGkxi08pNR4exenZEcn-zjBCtUco`, 
    { email, password }
  )

  const uid = resp.data.localId

  const customToken = await admin.auth().createCustomToken(uid)

  return res.json({ data: { uid, customToken }})
}


export async function signInWithGoogle(req: Request, res: Response, next: NextFunction) {
  const idToken = req.body.idToken;
  const accessToken = req.body.accessToken;


}

/*
  private static final String VERIFY_CUSTOM_TOKEN_URL =
      "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyCustomToken";
  private static final String VERIFY_PASSWORD_URL =
      "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword";
  private static final String RESET_PASSWORD_URL =
      "https://www.googleapis.com/identitytoolkit/v3/relyingparty/resetPassword";
  private static final String EMAIL_LINK_SIGN_IN_URL =
      "https://www.googleapis.com/identitytoolkit/v3/relyingparty/emailLinkSignin";
*/
