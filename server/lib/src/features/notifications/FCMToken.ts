import { model, Schema, Types } from 'mongoose'

export interface IFCMToken {
  _id: string
  token: string
  profile: string
  syncedAt: Date
  createdAt: Date
  updatedAt: Date
}

const FCMTokenSchema = new Schema({
  token: { type: String, required: true },
  profile: { type: String, required: true },
  syncedAt: { type: Date, default: () => new Date() },
})

export const FCMToken = model<IFCMToken>('FCMToken', FCMTokenSchema)