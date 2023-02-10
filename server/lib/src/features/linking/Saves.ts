import { Schema, model, Types } from "mongoose";

export interface ISaves {
	profile: string;
	book: string;
}

const SavesSchema = new Schema({
	profile: { type: Types.ObjectId, ref: "Profile", required: true },
	book: { type: Types.ObjectId, ref: "Book", required: true }
}, {
	timestamps: true
});

export const Saves = model<ISaves>("Saves", SavesSchema);