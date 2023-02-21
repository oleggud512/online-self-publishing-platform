import { PipelineStage, Types } from "mongoose"
import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder"
import { ReadingsState } from "../chapters/Chapter"
import { Book } from "./Book"
import * as commentsUtils from "../comments/comments-aggregation-utils"
import * as profileUtils from "../profiles/profile-aggreation-utils"
import * as bookUtils from "./book-aggregation-utils"
import { Filters } from "./Filters"

export class BookAggregationBuilder extends BaseAggregationBuilder {
  constructor() {
    super(Book)
  }

  book(id: string) {
    console.log(`id from aggregationBuilder = ${id}`)
    this.aggregation.match({ _id: new Types.ObjectId(id) })
    return this
  }

  books(filters: Filters) {
    this.aggregation.append(...bookUtils.filterBooks(filters))
    return this
  }

  profileBooks(ofProfile: string, forProfile?: string) {
    this.aggregation.append(...bookUtils.profileBooks(ofProfile, forProfile))
    return this
  }

  booksByIds(ids: string[]) {
    this.aggregation.append({
      $match: { 
        $expr: { 
          $in: [ "$_id", ids.map<Types.ObjectId>(i => new Types.ObjectId(i)) ] 
        }
      }
    })
    return this
  }

  withLiked(forProfile: string | undefined) {
    this.aggregation.lookup({
      from: 'likes',
      foreignField: 'subject',
      localField: '_id',
      as: 'profile_liked',
      pipeline: [
        {
          $match: {
            profile: forProfile ?? ""
          }
        }
      ]
    })
    this.aggregation.addFields({
      liked: { $gt: [{ $size: "$profile_liked" }, 0] },
    })
    this.aggregation.append({ $unset: "profile_liked" })
    return this
  }

  withBookmarked(forProfile: string | undefined) {
    console.log(`withBookmarked() forProfile = ${forProfile}`)
    this.aggregation.append(...bookUtils.withBookmarked(forProfile))
    return this
  }
  /**
   * should be called before the 'withAuthor()' because it makes '$author' 
   * unavailable. 
   */
  withChapters(forProfile: string | undefined) {
    this.aggregation.lookup({
      from: 'chapters',
      let: { bookId: '$_id', authorId: "$author" },
      pipeline: [
        {
          $match: {
            $expr: {
              $and: [
                { $eq: ["$book", "$$bookId"] },
                // if I try to get 'my' book, than display all chapters, 
                // else - published only
                {
                  $cond: {
                    if: { $eq: ["$$authorId", forProfile] }, // if the chapter is of my book
                    then: { },
                    else: { $eq: ["$state", ReadingsState.published] }
                  }
                }
              ]
            }
          }
        },
        { 
          $sort: {
            createdAt: 1
          } 
        },
        // if you want to get the chapters to display on BookScreen, you won't need all of the chapters
        { $limit: 5 }, 
        {
          $project: {
            _id: 1,
            name: 1,
            state: 1,
            createdAt: 1,
            updatedAt: 1
          }
        }
      ],
      as: 'chapters',
    })
    return this
  }

  withAuthor(whoIsSubscribed?: string | undefined) {
    this.aggregation
      .append(...profileUtils.somethingWithAuthor({
        pipeline: [
          ...profileUtils.isSubscribedField(whoIsSubscribed), // TODO: whoIsSubscribed
          {
            $project: {
              _id: 1,
              name: 1,
              displayName: 1,
              avatarUrl: 1,
              isSubscribed: 1,
              subscribers: 1
            }
          },
        ]
      }))
    return this
  }

  withComments(
    from: number = 0, 
    pageSize: number = 20, 
    sorting: 'new' | 'popular' = 'new'
  ) {
    var sort: PipelineStage.Sort["$sort"]
    switch (sorting) {
      case 'new': sort = { createdAt: 1 }
      case 'popular': sort = { likes: 1 }
    }

    this.aggregation.append(
      ...commentsUtils.withComments(
        // "$_id", 
        sort, from, pageSize))
    return this
  }

}