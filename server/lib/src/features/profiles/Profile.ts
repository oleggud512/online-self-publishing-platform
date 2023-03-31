import { Document, Schema, model } from "mongoose";
import { IBook } from "../books/Book";
import { Role } from "../users/models/Role";

export type Gender = "m" | "f" | "other" | "preferNotToSay"

export interface IProfile {
  _id: string
  email: string
  name: string
  displayName?: string
  age?: number
  gender?: Gender
  description?: string
  avatarUrl?: string
  subscribers?: number
  subscriptions?: number
  booksCount?: number

  permissions?: {
    publishBook: boolean
    addComment: boolean
  }

  books?: Array<IBook>

  createdAt?: Date
  updatedAt?: Date
}

const ProfileSchema: Schema = new Schema(
  {
    _id: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    name: { type: String, required: true },
    displayName: { type: String, required: false },
    gender: { type: String, default: "preferNotToSay" },
    age: { type: Number, required: false },
    description: { type: String, required: false },
    avatarUrl: { type: String, required: false },
    subscribers: { type: Number, default: 0 },
    subscriptions: { type: Number, default: 0 },
    booksCount: { type: Number, default: 0 },
    
    permissions: new Schema({
      publishBook: { type: Boolean, default: true },
      addComment: { type: Boolean, default: true }
    }),
    isBlocked: { type: Boolean, default: false }
  },
  { timestamps: true }
);

export const Profile = model<IProfile>("Profile", ProfileSchema);