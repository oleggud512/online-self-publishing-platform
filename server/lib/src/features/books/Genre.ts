import { Schema, model } from "mongoose";

export interface IGenre {
	name: string;
}

const GenreSchema = new Schema({
	name: { type: String, required: true }
}, {
	timestamps: true
});

export const Genre = model<IGenre>("Genre", GenreSchema);