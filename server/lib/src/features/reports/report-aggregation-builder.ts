import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder";
import { Sorting } from "../comments/Sorting";
import { Report } from "./Report";
import * as profileUtils from "../profiles/profile-aggreation-utils"

export class ReportAggregationBuilder extends BaseAggregationBuilder {
  constructor(private forProfile: string) {
    super(Report)
  }

  reports(
    subjectName: string, 
    state: string, 
    owner: string,
    sorting: Sorting
  ) {
    this.aggregation.append(
      {
        $match: {
          $and: [
            { $eq: [ "$subjectName", subjectName ] },
            { $eq: [ "$state", state ] },
            ...owner == 'my' ? [{ $eq: [ "$admin", this.forProfile ] }] : [],
          ]
        }
      },
      {
        $sort: sorting == 'new' 
          ? { createdAt: -1 } 
          : { createdAt: 1 } 
      },
      ...profileUtils.somethingWithAuthor({ pipeline: [
        {
          $project: {
            _id: 1, 
            name: 1, 
            displayName: 1,
            avatarUrl: 1,
          }
        }
      ]}),
      // admin
      {
        $lookup: {
          from: "profiles",
          localField: "admin",
          foreignField: "_id",
          as: "admin",
          pipeline: [
            {
              $project: {
                _id: 1, 
                name: 1, 
                displayName: 1,
                avatarUrl: 1,
              }
            }
          ]
        }
      },
      { $unwind: "$admin" },
      {
        $addFields: {
          admin: {
            $cond: {
              if: {
                $and: [
                  { $isArray: "$admin" },
                  // { $eq: [ { $size: "$admin" }, 0 ] }
                ]
              },
              then: null,
              else: "$admin"
            }
          }
        }
      }
    )
    return this
  }
}