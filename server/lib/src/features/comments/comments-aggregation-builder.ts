import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder";
import * as commentUtils from "./comments-aggregation-utils"
import { Comment } from "./Comment";
import { Sorting } from "./Sorting";
import { Types } from "mongoose";
import { somethingWithAuthor } from "../profiles/profile-aggreation-utils";

export class CommentsAggregationBuilder extends BaseAggregationBuilder {
  constructor() {
    super(Comment)
  }

  comment(id: string, forProfile?: string) {
    this.aggregation.append(
      {
        $match: {
          _id: new Types.ObjectId(id)
        }
      },
      ...commentUtils.withAnswersAndAuthor(),
      ...commentUtils.withMyRate(forProfile),
      ...commentUtils.withHasAnswers()
    )
    return this
  }

  comments(subjectId: string, sorting: Sorting, forProfile?: string) {
    this.aggregation.append(...commentUtils.topComments(subjectId, sorting, forProfile))
    return this
  }

  answers(questionId: string, forProfile?: string) {
    this.aggregation.append(...commentUtils.answers(questionId, forProfile))
    return this
  }
}