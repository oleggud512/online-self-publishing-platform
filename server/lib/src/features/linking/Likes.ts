import { Document, Schema, model, Types } from 'mongoose';
import { IBook } from '../books/Book';
import { IChapter } from '../chapters/Chapter';
import { IComment } from '../comments/Comment';
import { IProfile } from '../profiles/Profile';

export interface ILikes {
	profile: IProfile
	subject: IBook | IChapter | IComment
	active: Boolean
}

const LikesSchema = new Schema({
	profile: {
		type: Types.ObjectId,
		ref: 'Profile',
		required: true
	},
	subject: {
		type: Types.ObjectId,
		refPath: 'onModel',
		required: true
	},
	active: {
		type: Boolean,
		required: true
	},
	onModel: {
		type: String,
		enum: ['Book', 'Chapter', 'Comment'],
		required: true
	}
}, { timestamps: true });

export const Likes = model<ILikes>('Likes', LikesSchema);