import { Schema, model, Types } from "mongoose";

export interface IBookmarks {
	profile: string;
	book: string;
}

const BookmarksSchema = new Schema({
	profile: { type: String, ref: "Profile", required: true },
	book: { type: Types.ObjectId, ref: "Book", required: true }
}, {
	timestamps: true
});

export const Bookmarks = model<IBookmarks>("Bookmarks", BookmarksSchema);