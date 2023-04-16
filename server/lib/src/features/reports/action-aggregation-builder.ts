import { Types } from "mongoose";
import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder";
import { somethingWithAuthor } from "../profiles/profile-aggreation-utils";
import { Action, ActionType } from "./Action";

export class ActionAggregationBuilder extends BaseAggregationBuilder {
  constructor(public forProfile: string) {
    super(Action)
  }

  // for the regular user.
  messages(reportId: string) {
    this.aggregation.append(
      {
        $match: {
          report: new Types.ObjectId(reportId),
          actionType: ActionType.message
        }
      },
      ...somethingWithAuthor(),
      // {
      //   $lookup: {
      //     from: 'reports',
      //     localField: 'report',
      //     foreignField: '_id',
      //     as: 'report',
      //   }
      // },
      // {
      //   $unwind: "$report"
      // },
      { $sort: { createdAt: -1 } },
      {
        $project: {
          content: 1,
          createdAt: 1,
          updatedAt: 1,
          from: "$author",
        }
      }
    )
    return this
  }
}
