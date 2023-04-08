import { Document, Schema, model, Types, QueryWithHelpers, HydratedDocument, Model } from "mongoose";
import { IChapter, ReadingsState } from "../chapters/Chapter";
import { IProfile } from "../profiles/Profile";

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
  views: number
  commentCount: number
  score: number
  author: string | IProfile
  tags?: string[]
  genres?: string[]

  chapters?: Array<IChapter>

  createdAt?: Date
  updatedAt?: Date

  liked?: boolean
  bookmarked?: boolean
}


// interface BookQueryHelpers {
//   byName(name: string): QueryWithHelpers<HydratedDocument<IBook>[], HydratedDocument<IBook>, BookQueryHelpers>
// }

// type BookModelType = Model<IBook, BookQueryHelpers>;

const BookSchema = new Schema
// <
//   IBook, 
//   Model<IBook, BookQueryHelpers>, 
//   {}, 
//   BookQueryHelpers
// >
(
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
    views: { type: Number, default: 0 },
    commentCount: { type: Number, default: 0 },
    score: { type: Number, default: 0 },
    author: { type: String, ref: "Profile", required: true },
    tags: [{ type: String }],
    genres: [{ type: String }],
  },
  { timestamps: true }
);

// BookSchema.query.byName = function byName(
//   this: QueryWithHelpers<any, HydratedDocument<IBook>, BookQueryHelpers>,
//   name: string
// ) {

//   return this.find({ name: name });
// };


export const Book = model<IBook>("Book", BookSchema);
