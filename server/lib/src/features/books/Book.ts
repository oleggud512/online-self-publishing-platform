import { Document, Schema, model, Types } from "mongoose";
import { IChapter, ReadingsState } from "../chapters/Chapter";

export const BookStatus = {
  completed: 'completed',
  inProgress: 'inProgress',
  abandoned: 'abandoned'
}

export interface IBook {
  _id: string
  permanentlyUnpublished: boolean
  state: String
  status: String
  name: string
  description: string
  coverUrl: string
  likes: number
  author: string
  tags?: string[]
  genres?: string[]

  chapters?: Array<IChapter>

  createdAt?: Date
  updatedAt?: Date

  liked?: boolean
  bookmarked?: boolean
}

const BookSchema: Schema = new Schema(
  {
    permanentlyUnpublished: { 
      type: Boolean, 
      default: false
    },
    state: { 
      type: String, 
      enum: Object.values(ReadingsState), 
      default: ReadingsState.unpublished,
    },
    status: {
      type: String,
      enum: Object.values(BookStatus),
      default: BookStatus.inProgress
    },
    name: { type: String, required: true },
    description: { type: String },
    coverUrl: { type: String },
    likes: { type: Number, default: 0 },
    author: { type: String, ref: "Profile", required: true },
    tags: [{ type: String }],
    genres: [{ type: String }],
  },
  { timestamps: true }
);

export const Book = model<IBook>("Book", BookSchema);