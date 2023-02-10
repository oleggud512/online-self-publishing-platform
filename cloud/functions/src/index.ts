import * as functions from "firebase-functions";
import { UserRecord } from "firebase-functions/v1/auth";
import * as admin from "firebase-admin";

import serviceAccount = require("./serviceAccountKey.json");


type Role = 'admin' | 'user' | 'super-admin';

admin.initializeApp({
  credential: admin.credential.cert(<admin.ServiceAccount>serviceAccount)
})

export const setDefaultRole = functions.auth.user().onCreate(
  async (user: UserRecord) => {
    let uid = user.uid;
    await admin.auth().setCustomUserClaims(uid, { role: 'user' as Role });
    const updatedUser = await admin.auth().getUser(uid);
    console.log(updatedUser);
  }
);
