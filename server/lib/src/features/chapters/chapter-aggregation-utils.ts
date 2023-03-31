import { LookupPipeline } from "../../common/types";
import * as profileUtils from "../profiles/profile-aggreation-utils"

export function populateChapterPipeline() : LookupPipeline {
  return [
    {
      $lookup: {
        from: 'books',
        localField: 'book',
        foreignField: '_id',
        as: 'book',
        pipeline: [
          ...profileUtils.somethingWithAuthor()
        ]
      }
    },
    { $unwind: "$book" },
  ]
}