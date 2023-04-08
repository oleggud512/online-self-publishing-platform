import { Types } from "mongoose";
import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder";
import { somethingWithAuthor } from "../profiles/profile-aggreation-utils";
import { Chapter, ReadingsState } from "./Chapter";
import * as chapterUtils from "./chapter-aggregation-utils"

export class ChapterAggregationBuilder extends BaseAggregationBuilder {
  constructor(public forProfile?: string) {
    super(Chapter)
  }

  chapters(bookId: string) {
    console.log("something")
    console.log(bookId)
    this.aggregation.append(
      ...chapterUtils.populateChapterPipeline(),
      {
        $match: {
          $expr: {
            $and: [
              { $eq: [ "$book._id", new Types.ObjectId(bookId) ] },
              {
                $cond: {
                  if: { $eq: [ "$book.author._id",  this.forProfile  ]  },
                  then: { },
                  else: { $eq: [ "$state", ReadingsState.published ] }
                }
              }
            ]
          }
        }
      },
      {
        $sort: {
          createdAt: -1
        }
      }
    )
    return this
  }

}