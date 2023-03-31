/**
 * aggregation utils - слой абстракции, который находится под aggregation
 * builder. Используется только в aggregation builder. Используется для того
 * чтобы встраивать pipeline stages в любое место. 
 */
import { LookupPipeline } from "../../common/types";

/**
 * Everywhere where you use this, be shure that your author's id is an 'author' 
 * field in mongodb document. 
 */
export function somethingWithAuthor(
  // foreignField: string,
  args?: {
    localField?: string
    pipeline?: LookupPipeline
  }
) : LookupPipeline {
  return [
    {
      $lookup: {
        from: "profiles",
        localField: args?.localField ?? "author",
        foreignField: "_id",
        as: "author",
        pipeline: args?.pipeline ?? []
      },
    },
    { $unwind: '$author' }
  ];
}

/**
 * is @param profileId subscribed on 'this' profile
 * 
 * isSubscribed field for the document with @param profileId 
 * 
 * could be used as following
 * ```typescript
 * [
 *   some aggregation on books
 *   ...
 *   somethingWithAuthor("_id", { 
 *     pipeline: [
 *       ...isSubscribedField("some profile")
 *     ]
 *   })
 *   ...
 *   some other stages
 * ]
 * ```
 */
export function isSubscribedField(id: string | undefined) : LookupPipeline { 
  return [
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
                  { $eq: [ '$profile', id ] }
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
    },
    { $unset: "subscription_docs" }
  ]
}
