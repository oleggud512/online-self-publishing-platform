import { Types } from "mongoose";
import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder";
import { Chapter, ReadingsState } from "./Chapter";

export class ChapterAggregationBuilder extends BaseAggregationBuilder {
  constructor(public forProfile?: string) {
    super(Chapter)
  }

  chapters(bookId: string) {
    console.log("something")
    console.log(bookId)
    this.aggregation.append(
      {
        $lookup: {
          from: 'books',
          localField: 'book',
          foreignField: '_id',
          as: 'bookDoc'
        }
      },
      {
        $match: {
          $expr: {
            $and: [
              { $eq: [ "$book", new Types.ObjectId(bookId) ] },
              {
                $cond: {
                  if: { 
                    $eq: [ 
                      { $first: "$bookDoc.author" }, 
                      this.forProfile 
                    ] 
                  },
                  then: { },
                  else: { $eq: [ "$state", ReadingsState.published ] }
                }
              }
            ]
          }
        }
      },
      { $unset: "bookDoc" }
    )
    return this
  }

}