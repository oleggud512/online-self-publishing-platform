import admin from "firebase-admin"
import { UserRecord } from "firebase-admin/lib/auth/user-record"
import { FireUser } from "./models/FireUser"
import { Role } from "./models/Role"
import * as actionService from "../reports/action-service"
import { ActionType } from "../reports/Action"
import { Profile } from "../profiles/Profile"
import * as restrictionService from "../restrictions/service"

function recordToFireUser(user: UserRecord) : FireUser {
  return {
    uid: user.uid,
    dispalyName: user.displayName,
    email: user.email!,
    role: user.customClaims?.role as Role,
    allowComment: user.customClaims?.allowComment,
    allowPublish: user.customClaims?.allowPublish
  }
}


export async function createUser(u: { displayName: string, password: string, role: string, email: string }) : Promise<FireUser> {
  const createdUser = await admin.auth().createUser({
    displayName: u.displayName,
    password: u.password, 
    email: u.email
  })

  await admin.auth().setCustomUserClaims(createdUser.uid, { role: u.role })

  return {
    uid: createdUser.uid,
    dispalyName: createdUser.displayName,
    email: createdUser.email!,
    role: u.role as Role,
  }
}

export async function getUsers() : Promise<Array<FireUser>> {
  const listUsers = await admin.auth().listUsers()
  const users = listUsers.users.map(recordToFireUser)
  return users
}

export async function getUser(uid: string) : Promise<FireUser> {
  const record = await admin.auth().getUser(uid)
  return recordToFireUser(record)
}

export async function updateUser(
  uid: string, 
  updates: { 
    displayName?: string, 
    email?: string, 
    password?: string,
    role?: Role, 
    allowComment?: boolean,
    allowPublish?: boolean
  }
) : Promise<FireUser> {
  const { displayName, password, email, role, allowComment, allowPublish } = updates
  const updatedUser = await admin.auth().updateUser(uid, {displayName, password, email})
  
  if (role !== undefined 
      || allowComment !== undefined 
      || allowPublish !== undefined) {
    console.log(`updating custom claims. role=${role} allowComment=${allowComment} allowPublish=${allowPublish}`)
    await admin.auth().setCustomUserClaims(uid, {
      role: role ?? updatedUser.customClaims?.role, 
      allowComment: allowComment ?? updatedUser.customClaims?.allowComment, 
      allowPublish: allowPublish ?? updatedUser.customClaims?.allowPublish
    })
  }

  const user = await admin.auth().getUser(uid)
  return recordToFireUser(user)
}

export async function isAdmin(email: string) {
  const user = await admin.auth().getUserByEmail(email as string);
  console.log(`verification: ${JSON.stringify(user, null, 2)}`);
  return (['admin', 'super-admin'] as Array<Role>).includes(user.customClaims?.role ?? '');
}

export async function deleteUser(uid: string) {
  await admin.auth().deleteUser(uid);
}


export async function toggleBlocked(
  profileId: string, 
  adminId: string, 
  before?: Date
) : Promise<boolean> {
  const user = await admin.auth().getUser(profileId)

  const newRole = user.customClaims?.role == 'blocked' as Role
    ? 'user' as Role
    : 'blocked' as Role
  
  if (newRole == 'blocked') {
    await admin.auth().revokeRefreshTokens(profileId)
  }

  await admin.auth().setCustomUserClaims(profileId, {
    ...user.customClaims,
    role: newRole
  })

  restrictionService.toggleBlocked(profileId)

  actionService.addProfileUpdated({
    actionType: newRole == 'blocked' 
      ? ActionType.profileBlocked
      : ActionType.profileUnblocked,
    profileId: profileId,
    authorId: adminId
  });
  admin.auth().getUser(profileId).then(u => {
    console.log(u.customClaims)
  })

  return newRole == 'blocked'
}

export async function isBlocked(profileId: string) : Promise<boolean> {
  const user = await admin.auth().getUser(profileId)
  console.log({claims: user?.customClaims, isBlocked: user?.customClaims?.role == 'blocked'})
  return user?.customClaims?.role == 'blocked' as Role
}