import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder";
import { somethingWithAuthor } from "../profiles/profile-aggreation-utils";
import { Bookmarks } from "./Bookmarks";

export class BookmarksAggregationBuilder extends BaseAggregationBuilder {
  constructor() {
    super(Bookmarks)
  }

  bookmarks(forProfile: string) {
    this.aggregation
      .match({ profile: forProfile })
      .lookup({
        from: 'books',
        localField: "book",
        foreignField: "_id",
        as: 'book_array',
        pipeline: [
          ...somethingWithAuthor({
            pipeline: [
              {
                $project: {
                  _id: 1, 
                  name: 1,
                  displayName: 1
                }
              }
            ]
          }),
          {
            $addFields: { // if you got it here then it definitely bookmarked
              bookmarked: true
            }
          }
        ]
      })
      .replaceRoot({ $arrayElemAt: ['$book_array', 0] })

    return this
  }
  
}