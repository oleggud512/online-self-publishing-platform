import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder";
import { Sorting } from "../comments/Sorting";
import { Report, ReportState, ReportSubject } from "./Report";
import * as profileUtils from "../profiles/profile-aggreation-utils"
import * as baseUtils from "../../shared/base-aggregation-utils"
import { ActionType } from "./Action";
import { Types } from "mongoose";
import { CommentSubjects } from "../comments/CommentSubjects";
import * as commentUtils from "../comments/comments-aggregation-utils"

export class ReportAggregationBuilder extends BaseAggregationBuilder {
  constructor(private forProfile: string) {
    super(Report)
  }

  // чаты открытых жалоб для конечного пользователя
  chats() { 
    console.log(this.forProfile)
    this.aggregation.append(
      { 
        $match: { 
          state: ReportState.inProgress,
          defendant: this.forProfile 
        }
      },
      {
        $lookup: {
          from: "actions",
          localField: "_id",
          foreignField: "report",
          as: "lastMessage",
          pipeline: [
            {
              $match: {
                actionType: ActionType.message
              }
            },
            {
              $sort: {
                createdAt: -1
              }
            },
            {
              $limit: 1
            }
          ]
        }
      },
      {
        $unwind: { path: "$lastMessage", preserveNullAndEmptyArrays: true }
      },
      {
        $project: {
          other: {
            _id: { $getField: "_id" },
            name: { $getField: "reportType" }
          },
          lastMessage: "$lastMessage.content"
        }
      }
    )
    return this
  }

  report(reportId: string) {
    this.aggregation.append(
      { 
        $match: {
          _id: new Types.ObjectId(reportId),
        }
      },
      // populate author
      ...profileUtils.somethingWithAuthor(),
      // populate admin
      ...baseUtils.tryLookup({
        from: 'profiles',
        localField: 'admin',
        foreignField: '_id',
        as: 'admin'
      }),
      // populate reportType
      ...baseUtils.tryLookup({
        from: 'reporttypes',
        localField: 'reportType',
        foreignField: 'name',
        as: 'reportType'
      }),

      // populate subject 
      {
        $lookup: {
          from: 'profiles',
          localField: 'subject',
          foreignField: '_id',
          as: 'profile'
        }
      },
      {
        $lookup: {
          from: 'books',
          localField: 'subject',
          foreignField: '_id',
          as: 'book',
          pipeline: [
            ...profileUtils.somethingWithAuthor(),
          ]
        }
      },
      {
        $lookup: {
          from: 'comments',
          localField: 'subject',
          foreignField: '_id',
          as: 'comment',
          pipeline: [
            ...profileUtils.somethingWithAuthor(),
            ...commentUtils.withFullSubject()
          ]
        }
      },
      {
        $addFields: {
          subject: {
            $cond: {
              if: { $eq: [ "$subjectName", ReportSubject.book] },
              then: { $arrayElemAt: ["$book", 0] },
              else: {
                $cond: {
                  if: { $eq: ["$subjectName", ReportSubject.profile] },
                  then: { $arrayElemAt: ["$profile", 0] },
                  else: { $arrayElemAt: ["$comment", 0] },
                }
              }
            }
          }
        }
      },
      // populate actions
      {
        $lookup: {
          from: "actions",
          localField: "_id",
          foreignField: "report",
          as: "actions",
          pipeline: [
            { 
              $sort: { createdAt: -1 }
            }
          ]
        }
      }

      
    )
    return this
  }

  // reports(
  //   subjectName: string, 
  //   state: string, 
  //   owner: string,
  //   sorting: Sorting
  // ) {
  //   this.aggregation.append(
  //     {
  //       $match: {
  //         $and: [
  //           { $eq: [ "$subjectName", subjectName ] },
  //           { $eq: [ "$state", state ] },
  //           ...owner == 'my' ? [{ $eq: [ "$admin", this.forProfile ] }] : [],
  //         ]
  //       }
  //     },
  //     {
  //       $sort: sorting == 'new' 
  //         ? { createdAt: -1 } 
  //         : { createdAt: 1 } 
  //     },
  //     ...profileUtils.somethingWithAuthor({ pipeline: [
  //       {
  //         $project: {
  //           _id: 1, 
  //           name: 1, 
  //           displayName: 1,
  //           avatarUrl: 1,
  //         }
  //       }
  //     ]}),
  //     // admin
      // {
      //   $lookup: {
      //     from: "profiles",
      //     localField: "admin",
      //     foreignField: "_id",
      //     as: "admin",
      //     pipeline: [
      //       {
      //         $project: {
      //           _id: 1, 
      //           name: 1, 
      //           displayName: 1,
      //           avatarUrl: 1,
      //         }
      //       }
      //     ]
      //   }
      // },
      // { $unwind: "$admin" },
      // {
      //   $addFields: {
      //     admin: {
      //       $cond: {
      //         if: {
      //           $and: [
      //             { $isArray: "$admin" },
      //             // { $eq: [ { $size: "$admin" }, 0 ] }
      //           ]
      //         },
      //         then: null,
      //         else: "$admin"
      //       }
      //     }
      //   }
      // }
  //   )
  //   return this
  // }
}