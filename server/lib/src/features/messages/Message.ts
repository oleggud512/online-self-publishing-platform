import { Schema, model, Document, Types } from "mongoose";
import { IProfile } from "../profiles/Profile";

export type Chat = {
	other: IProfile
	firstMessage: string
}

export interface IMessage {
	_id: string;
	content: string;
	from: IProfile;
	to: string;

  createdAt?: Date;
  updatedAt?: Date;
}

const MessageSchema = new Schema({
	content: { type: String, required: true },
	from: { type: String, ref: "Profile", required: true },
	to: { type: String, ref: "Profile", required: true }
}, {
	timestamps: true
});

export const Message = model<IMessage>("Message", MessageSchema)