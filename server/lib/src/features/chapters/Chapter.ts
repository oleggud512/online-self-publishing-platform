import { Schema, model, Document, Types } from 'mongoose';
import { IBook } from '../books/Book';


export const ReadingsState = {
  published: 'published',
  unpublished: 'unpublished'
}

export interface IChapter extends Document {
  _id: string
  name: string
  state: string
  book: string // id reference
  content?: string
  
  createdAt?: Date;
  updatedAt?: Date;
}

const ChapterSchema = new Schema(
  {
    name: { type: String, required: true },
    state: { 
      type: String, 
      enum: [ReadingsState.published, ReadingsState.unpublished], 
      default: ReadingsState.unpublished,
    },
    book: {
      type: Types.ObjectId,
      ref: "Book",
      required: true,
    },
    content: { type: String, required: true },
  },
  { timestamps: true }
);

export const Chapter = model<IChapter>('Chapter', ChapterSchema);

