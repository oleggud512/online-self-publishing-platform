import { Schema, model, Types } from 'mongoose';
import { IBook } from '../books/Book';
import { IChapter } from '../chapters/Chapter';
import { IProfile } from '../profiles/Profile';

export interface IComment {
  _id: string
  content: string
  author: string | IProfile
  rate: number
  depth: number
  subject: IBook | IChapter | string
  subjectName: string
  question: string

  hasAnswers?: boolean
  
  answers?: IComment[]
  
  createdAt?: Date
  updatedAt?: Date
}

const CommentSchema = new Schema({
  content: { type: String, required: true },
  author: { type: String, ref: "Profile", required: true },
  rate: { type: Number, default: 0 },
  depth: { type: Number, default: 0 },
  question: { type: Types.ObjectId, ref: "Comment" },
  subject: { 
    type: Types.ObjectId, 
    refPath: 'subjectName', 
    required: true, 
  },
  subjectName: {
		type: String,
		enum: ['Book', 'Chapter'],
		required: true
  },
}, { timestamps: true });

export const Comment = model<IComment>('Comment', CommentSchema);