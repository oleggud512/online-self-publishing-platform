import { PipelineStage, Types } from "mongoose"
import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder"
import { ReadingsState } from "../chapters/Chapter"
import { Book } from "./Book"
import * as profileUtils from "../profiles/profile-aggreation-utils"
import * as bookUtils from "./book-aggregation-utils"
import { Filters } from "./Filters"
import { Sorting } from "../comments/Sorting"
import * as commentsUtils from "../comments/comments-aggregation-utils"
import * as chapterUtils from "../chapters/chapter-aggregation-utils"
import * as baseUtils from "../../shared/base-aggregation-utils"

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

  popularBooks() { 
    this.aggregation.append(...bookUtils.filterBooks(new Filters()))
    this.aggregation.sort({ score: -1 })
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
            profile: forProfile ?? "",
            active: true
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
  withChapters(forProfile: string | undefined, allChapters: boolean = false) {
    this.aggregation.lookup({
      from: 'chapters',
      localField: "_id",
      foreignField: "book",
      let: { bookId: '$_id', authorId: "$author" },
      pipeline: [
        ...chapterUtils.populateChapterPipeline(),
        {
          $match: {
            $expr: {
              $cond: {
                if: { $eq: [ "$$authorId", forProfile ] },
                then: true,
                else: { $eq: [ "$state", ReadingsState.published ]}
              }
            }
          }
        },
        { 
          $sort: {
            createdAt: -1
          }
        },
        ...!allChapters ? [ { $limit: 5 } ] : []
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

  // withComments(
  //   from: number = 0, 
  //   pageSize: number = 20, 
  //   sorting: Sorting,
  //   subjectId: string
  // ) {
  //   this.aggregation.append(
  //     {
  //       $lookup: {
  //         from: 'comments',
  //         localField: '_id',
  //         foreignField: 'subject',
  //         as: 'comments',
  //         pipeline: [
  //           ...commentsUtils.topComments(subjectId, sorting),
  //           ...baseUtils.page(from, pageSize)
  //         ]
  //       }
  //     }
  //   )
  //   return this
  // }

}
