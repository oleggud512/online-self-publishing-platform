import * as profileUtils from "../profiles/profile-aggreation-utils"
import * as baseUtils from "../../shared/base-aggregation-utils"
import * as commentUtils from "../comments/comments-aggregation-utils"
import { LookupPipeline } from "../../common/types";
import { ReportSubject } from "./Report";

export function reportPopulationPipeline() : LookupPipeline {
  return [
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
  ]
}