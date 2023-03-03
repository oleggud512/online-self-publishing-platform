import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder";
import { Message } from "./Message";

export class MessageAggregationBuilder extends BaseAggregationBuilder {
  constructor(public forProfile: string) {
    super(Message)
  }

  chats() {
    this.aggregation.append(
      { $match: { $or: [ { from: this.forProfile }, { to: this.forProfile } ] } },
      { $sort: { createdAt: -1 } },
      {
        $group: {
          _id: {
            $cond: {
              if: { $eq: ['$from', this.forProfile] },
              then: '$to',
              else: '$from'
            }
          },
          lastMessage: { $first: '$content' }
        }
      },
      {
        $lookup: {
          from: 'profiles',
          localField: '_id',
          foreignField: '_id',
          as: 'other'
        }
      },
      { $unwind: '$other' },
      {
        $project: {
          other: {
            _id: '$other._id',
            name: '$other.name',
            displayName: '$other.displayName',
            avatarUrl: '$other.avatarUrl'
          },
          lastMessage: 1
        }
      }
    )
    return this
  }

  messages(other: string) {
    this.aggregation.append(
      {
        $match: {
          $or: [
            { from: other, to: this.forProfile },
            { from: this.forProfile, to: other }
          ]
        }
      },
      { $sort: { createdAt: -1 } },
      {
        $lookup: {
          from: 'profiles',
          localField: 'from',
          foreignField: '_id',
          as: 'from'
        }
      },
      { $unwind: "$from" },
      {
        $project: {
          content: 1,
          createdAt: 1,
          updatedAt: 1,
          to: 1,
          from: {
            _id: 1,
            name: 1, 
            displayName: 1,
            avatarUrl: 1
          }
        }
      }
    )
    return this
  }
}
