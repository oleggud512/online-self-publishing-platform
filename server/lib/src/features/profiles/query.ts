import { PipelineStage } from "mongoose"
import { Profile } from "./Profile"

export class ProfilesAggregation {
  private stages: PipelineStage[] = []
  // private aggreagation = Profile.aggregate()

  profile(_id: string) {
    this.stages.push({
      $match: {
        _id: _id
      }
    })
    return this
  }
  
  withBooks() {
    this.stages.push({
      $lookup: {
        from: "books",
        localField: "_id",
        foreignField: "author",
        as: "books",
        pipeline: [
          {
            $lookup: {
              from: "profiles",
              localField: "author",
              foreignField: "_id",
              as: "author"
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
            }
          },
          {
            $unwind: {
              path: "$author"
            }
          }
        ]
      }
    })
    return this
  }

  profiles(query: string, from: number, limit: number) {
    this.stages.push(
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
      {
        $skip: from
      },
      {
        $limit: limit,
      },
    )
    return this
  }

  exclude(profileId: string) {
    this.stages.push({ $match: { _id: { $ne: profileId } } })
    return this
  }

  withIsSubscribed(profileId: string | undefined) {
    this.stages.push(
      {
        $lookup: {
          from: 'subscriptions', 
          let: {
            profileId: '$_id',
          }, 
          pipeline: [
            {
              $match: {
                $expr: {
                  $and: [
                    { $eq: [ '$subscribedTo', '$$profileId' ] }, 
                    { $eq: [ '$profile', profileId ] }
                  ]
                }
              }
            }
          ], 
          as: 'subscription_docs'
        }
      }, 
      {
        $addFields: {
          isSubscribed: {
            $cond: {
              if: { $gt: [ { $size: '$subscription_docs' }, 0 ] }, 
              then: true, 
              else: false
            }
          }
        }
      }
    )
    return this
  }

  build() {
    return this.stages
  }
}