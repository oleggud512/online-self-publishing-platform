import { model, ObjectId, Schema, Types } from "mongoose"
import { IBook } from "../books/Book"
import { IProfile } from "../profiles/Profile"

export namespace BookView {
  interface I<BT extends string | IBook, PT extends string | IProfile> {
    _id: ObjectId
    id: string
    book: BT
    profile: PT
  }

  export type IFlat = I<string, string>
  export type IPop = I<IBook, IProfile>

  const BookViewSchema = new Schema({
    profile: {
      required: true,
      type: String,
      ref: "Profile"
    },
    book: {
      required: true,
      type: Types.ObjectId,
      ref: "Book"
    }
  }, { timestamps: true })

  export const M = model<IFlat>('BookView', BookViewSchema)
}
