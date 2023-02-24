import { PipelineStage, Types } from "mongoose";
import { LookupPipeline } from "../../common/types";
import * as profileUtils from "../profiles/profile-aggreation-utils"
import { Sorting } from "./Sorting";


export function topComments(subjectId: string, sorting: Sorting, forProfile?: string) : LookupPipeline {
  console.log('topComments(subjectId: string, sorting: Sorting)')
  return [
    {
      $match: {
        subject: new Types.ObjectId(subjectId),
        $expr: {
          $and: [
            { $eq: [ "$subject", new Types.ObjectId(subjectId) ] },
            { $eq: [ "$depth", 0 ] }
          ]
        }
      },
    },
    ...comments(forProfile),
    {
      $sort: sorting == 'new' 
        ? { createdAt: -1 } 
        : sorting == 'old' 
          ? { createdAt: 1 } 
          : { rate: -1 }
    }
  ]
}

export function answers(questionId: string, forProfile?: string) : LookupPipeline {
  return [
    {
      $match: {
        question: new Types.ObjectId(questionId)
      }
    },
    ...comments(forProfile),
  ]
}

export function comments(forProfile?: string) : LookupPipeline {
  return [
    ...withAnswersAndAuthor({
      pipeline: [
        ...withAnswersAndAuthor({
          pipeline: [
            ...withAnswersAndAuthor({
              pipeline: [
                ...withAnswersAndAuthor(),
                ...withHasAnswers(),
                ...withMyRate(forProfile),
                { $unset: "answers" },
                { $sort: { createdAt: -1 } }
              ]
            }),
            ...withHasAnswers(),
            ...withMyRate(forProfile),
            { $sort: { createdAt: -1 } }
          ]
        }),
        ...withHasAnswers(),
        ...withMyRate(forProfile),
        { $sort: { createdAt: -1 } }
      ]
    }),
    ...withHasAnswers(),
    ...withMyRate(forProfile)
  ]
}

export function withHasAnswers() : LookupPipeline { 
  return [
    {
      $addFields: {
        hasAnswers: { $gt: [ { $size: "$answers" }, 0 ]}
        // has: {
        //   cond: { $expr: { authors: }}
        // }
      }
    }
  ]
}

export function withAnswersAndAuthor(args?: {
  pipeline?: LookupPipeline
}) : LookupPipeline {
  return [
    ...profileUtils.somethingWithAuthor({
      pipeline: [
        {
          $project: {
            _id: 1, 
            name: 1, 
            displayName: 1,
            avatarUrl: 1
          }
        }
      ]
    }),
    {
      $lookup: {
        from: "comments",
        localField: "_id",
        foreignField: "question",
        as: "answers",
        pipeline: args?.pipeline ?? []
      }
    }
  ]
}

export function withMyRate(forProfile?: string) : LookupPipeline {
  return [
    ...forProfile ? [
      {
        $lookup: {
          from: "likes",
          localField: "_id",
          foreignField: "subject",
          as: "tempMyRateDocument",
          pipeline: [
            {
              $match: {
                profile: forProfile
              }
            }
          ]
        }
      },
      {
        $addFields: {
          myRate: {
            $cond: {
              if: { $gt: [ { $size: "$tempMyRateDocument" }, 0 ] },
              then: {
                $first: "$tempMyRateDocument.rate"
              },
              else: null
            }
          }
        }
      },
      { $unset: "tempMyRateDocument" }
    ] : []
  ]
}