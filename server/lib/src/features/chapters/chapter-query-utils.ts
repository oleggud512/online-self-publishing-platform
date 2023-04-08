import { PopulateOptions } from "mongoose";
import { authorPopulateOption } from "../profiles/profile-query-utils";

export const chapterPopulateOptions: PopulateOptions[] = [
  { 
    path: 'book',
    justOne: true,
    populate: authorPopulateOption
  }
]
