import { Schema, model, Document, Types } from "mongoose";

export interface IMessage {
	_id: string;
	content: string;
	from: string;
	to: string;

  createdAt?: Date;
  updatedAt?: Date;
}

const MessageSchema = new Schema({
	content: { type: String, required: true },
	from: { type: Types.ObjectId, ref: "Profile", required: true },
	to: { type: Types.ObjectId, ref: "Profile", required: true }
}, {
	timestamps: true
});