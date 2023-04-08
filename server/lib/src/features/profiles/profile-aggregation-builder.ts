import { PipelineStage } from "mongoose"
import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder"
import { Profile } from "./Profile"
import * as profileUtils from "./profile-aggreation-utils"
import * as bookUtils from "../books/book-aggregation-utils"
import * as reportUtils from "../reports/report-aggregation-utils"
import { Filters } from "../books/Filters"

export class ProfileAggregationBuilder extends BaseAggregationBuilder {
  constructor() {
    super(Profile)
  }

  profile(_id: string) {
    this.aggregation.append({
      $match: {
        _id: _id
      }
    })
    return this
  }
  
  withBooks(ofProfile: string, forProfile?: string) {
    console.log(`for profile = ${forProfile}`)
    this.aggregation.append({
      $lookup: {
        from: "books",
        localField: "_id",
        foreignField: "author", // значит, сразу же получили все книги именно этого автора. 
        as: "books",
        pipeline: [
          ...bookUtils.profileBooks(ofProfile, forProfile),
          ...bookUtils.withBookmarked(forProfile),
          {
            $lookup: {
              from: "profiles",
              localField: "author",
              foreignField: "_id",
              as: "author"
            }
          },
          {
            $unwind: {
              path: "$author"
            }
          },
          {
            $project: {
              author: {
                _id: 1, 
                name: 1, 
                displayName: 1,
                avatarUrl: 1
              },
              _id: 1,
              name: 1, 
              coverUrl: 1, 
              description: 1,
              likes: 1,
              bookmarked: 1,
              state: 1
            }
          },
        ]
      }
    })
    return this
  }

  withReports() {
    this.aggregation.append(
      {
        $lookup: {
          from: "reports",
          localField: "_id",
          foreignField: "defendant",
          as: "reports",
          pipeline: [
            ...reportUtils.reportPopulationPipeline(),
            {
              $sort: {
                createdAt: -1
              }
            }
          ]
        }
      },
      {
        $lookup: {
          from: "reports",
          localField: "_id",
          foreignField: "author",
          as: "reported",
          pipeline: [
            ...reportUtils.reportPopulationPipeline(),
            {
              $sort: {
                createdAt: -1
              }
            }
          ]
        }
      }
    )
    return this
  }
  
  profiles(query: string) {
    this.aggregation.append(
      {
        $match: {
          $expr: {
            $or: [
              {  // TODO: change to livenschtain
                $regexMatch: {
                  input: '$name',
                  regex: RegExp(query, 'i')
                },
              },
              {
                $regexMatch: {
                  input: '$displayName',
                  regex: RegExp(query, 'i')
                },
              },
              {
                $regexMatch: {
                  input: '$description',
                  regex: RegExp(query, 'i')
                },
              },
            ]
          }
        }
      },
      {
        $sort: {
          createdAt: 1 // TODO: change to livenschtain
        }
      },
    )
    return this
  }

  popularAuthors() {
    this.aggregation.append(
      {
        $lookup: {
          from: 'books',
          localField: '_id',
          foreignField: 'author',
          as: 'books',
        }
      },
      {
        $addFields: {
          score: {
            $sum: "$books.score"
          }
        }
      },
      { $unset: "books" },
      { $sort: { score: -1 } }
    )
    return this
  }

  exclude(profileId: string) {
    this.aggregation.append({ $match: { _id: { $ne: profileId } } })
    return this
  }

  withIsSubscribed(profileId: string | undefined) {
    this.aggregation.append(...profileUtils.isSubscribedField(profileId))
    return this
  }
}
