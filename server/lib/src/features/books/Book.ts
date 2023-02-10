import { Document, Schema, model, Types } from "mongoose";
import { PublicationState } from "../chapters/Chapter";

export interface IBook {
  _id: string
  permanentlyUnpublished: boolean;
  state: PublicationState;
  name: string;
  description: string;
  coverUrl: string;
  likes: number;
  author: string;
  tags?: string[];
  genres?: string[];

  createdAt?: Date;
  updatedAt?: Date;
}

const BookSchema: Schema = new Schema(
  {
    permanentlyUnpublished: { type: Boolean, required: true },
    state: { type: String, required: true },
    name: { type: String, required: true },
    description: { type: String, required: true },
    coverUrl: { type: String, required: true },
    likes: { type: Number, required: true },
    author: { type: String, ref: "Profile", required: true },
    tags: [{ type: String }],
    genres: [{ type: String }],
  },
  { timestamps: true }
);

export const Book = model<IBook>("Book", BookSchema);