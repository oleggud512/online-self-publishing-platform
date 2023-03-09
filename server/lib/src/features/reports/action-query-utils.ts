import { PopulateOptions } from "mongoose";
import { Constants } from "../../shared/Constants";

export const actionPopulateOptions : PopulateOptions[] = [
  { path: 'author', select: Constants.profileSelectMin },
  { path: 'meta.book', select: '_id name' },
  { path: 'meta.chapter', select: '_id name' }
]