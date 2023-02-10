import { Schema, model, Types } from 'mongoose';
import { IBook } from '../books/Book';
import { IChapter } from '../chapters/Chapter';
import { IProfile } from '../profiles/Profile';

export interface IComment {
  _id: string
  content: string
  subject: IBook | IChapter,
  author: IProfile
  likes: number
  
  createdAt?: Date;
  updatedAt?: Date;
}

const CommentSchema = new Schema({
  content: { type: String, required: true },
  subject: { type: Types.ObjectId, required: true, },
  author: { 
    type: Types.ObjectId, 
    refPath: 'onModel', 
    required: true, 
  },
  onModel: {
		type: String,
		enum: ['Book', 'Chapter'],
		required: true
  },
  likes: { type: Number, default: 0 },
}, { timestamps: true });

export const Comment = model<IComment>('Comment', CommentSchema);