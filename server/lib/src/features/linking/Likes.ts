import { Document, Schema, model, Types } from 'mongoose';
import { IBook } from '../books/Book';
import { IChapter } from '../chapters/Chapter';
import { IComment } from '../comments/Comment';
import { IProfile } from '../profiles/Profile';

export interface ILikes {
  profile: IProfile
  subject: IBook | IChapter | IComment
  subjectName: string
  rate: number
  active: Boolean
}

const LikesSchema = new Schema({
  profile: {
    type: String,
    ref: 'Profile',
    required: true
  },
  subject: {
    type: Types.ObjectId,
    refPath: 'subjectName',
    required: true
  },
  subjectName: {
    type: String,
    enum: ['Book', 'Chapter', 'Comment'],
    // required: true
  },
  rate: {
    type: Number,
    default: 0
  },
  active: {
    type: Boolean,
    default: true
  },
}, { timestamps: true });

export const Likes = model<ILikes>('Likes', LikesSchema);