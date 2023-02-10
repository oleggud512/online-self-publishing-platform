import { Schema, model } from "mongoose";

export interface ITag {
	name: string;
}

const TagSchema = new Schema({
	name: { type: String, required: true }
}, {
	timestamps: true
});

export const Tag = model<ITag>("Tag", TagSchema);