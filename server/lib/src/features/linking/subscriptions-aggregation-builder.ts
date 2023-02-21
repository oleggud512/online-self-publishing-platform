import { Aggregate } from "mongoose";
import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder";
import { IProfile } from "../profiles/Profile";
import { ISubscriptions, Subscriptions } from "./Subscriptions";


export class SubscriptionsAggregationBuilder extends BaseAggregationBuilder {
  constructor() {
    super(Subscriptions);
  }
  /**
   * кто подписан на него
   */
  subscribers(profileId: string) : SubscriptionsAggregationBuilder {
    this.aggregation
      .match({ subscribedTo: profileId })
      .lookup({
        from: "profiles",
        localField: "profile",
        foreignField: "_id",
        as: "profile",
      })
      .replaceRoot({ $arrayElemAt: ['$profile', 0] })
    return this
  }

  /**
   * на кого подписан он
   */
  subscriptions(profileId: string) : SubscriptionsAggregationBuilder {
    this.aggregation
      .match({ profile: profileId })
      .lookup({
        from: "profiles",
        localField: "subscribedTo",
        foreignField: "_id",
        as: "subscribedTo",
      })
      .replaceRoot({ $arrayElemAt: ['$subscribedTo', 0] })
    return this
  }
}