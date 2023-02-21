import { PipelineStage } from "mongoose";
import { LookupPipeline } from "../../common/types";
import * as profileUtils from "../profiles/profile-aggreation-utils"

export function withComments(
  // subjectFieldPath: String, 
  sort: PipelineStage.Sort["$sort"],
  from: number, 
  pageSize: number
) : PipelineStage[] {
    return [
      {
        $lookup: {
          from: 'comments',
          localField: '_id',
          foreignField: 'subject',
          pipeline: [
            { $sort: sort },
            { $skip: from },
            { $limit: pageSize },
            ...profileUtils.somethingWithAuthor({
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
            }),
          ],
          as: 'comments'
        }
      }
    ]
}
