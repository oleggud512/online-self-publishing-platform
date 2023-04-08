import { BaseAggregationBuilder } from "../../shared/base-aggregation-builder";
import * as commentUtils from "./comments-aggregation-utils"
import { Comment } from "./Comment";
import { Sorting } from "./Sorting";
import { Types } from "mongoose";
import { somethingWithAuthor } from "../profiles/profile-aggreation-utils";
import { CommentSubjects } from "./CommentSubjects";

export class CommentsAggregationBuilder extends BaseAggregationBuilder {
  constructor() {
    super(Comment)
  }

  // TODO: тут можно было бы заменить comment и commentReciver на comment(id, forProfile, withFullSubject = false, withReciever = false)

  comment(id: string, forProfile?: string, withFullSubject: boolean = false) {
    this.aggregation.append(
      {
        $match: {
          _id: new Types.ObjectId(id)
        }
      },
      ...commentUtils.withAnswersAndAuthor(),
      ...commentUtils.withMyRate(forProfile),
      ...commentUtils.withHasAnswers(),
      ... withFullSubject 
        ? commentUtils.withFullSubject() 
        : []
    )
    return this
  }

  // returns the author of the subject (book or chapter)
  commentReceiver(commentId: string) {
    this.aggregation.append(
      {
        $match: {
          _id: new Types.ObjectId(commentId)
        }
      },
      ...commentUtils.withFullSubject(),
      {
        $addFields: {
          reciever: {
            $cond: {
              if: { $eq: [ "$subjectName", CommentSubjects.book ] },
              then: "$subject.author",
              else: "$subject.book.author"
            } 
          }
        }
      },
      {
        $replaceRoot: {
          newRoot: "$reciever"
          // newRoot: {
          //   $expr: {
          //     $cond: {
          //       if: { $eq: [ "subjectName", CommentSubjects.book ] },
          //       then: "$subject.author",
          //       else: "$subject.book.author"
          //     } 
          //   }
          // } 
        } 
      }
    ) 
    return this 
  } 
    
  comments(subjectId: string, sorting: Sorting, forProfile?: string, full: boolean = false) {
    this.aggregation.append(...commentUtils.topComments(subjectId, sorting, forProfile, full))
    return this
  }

  answers(questionId: string, forProfile?: string, full: boolean = false) {
    this.aggregation.append(...commentUtils.answers(questionId, forProfile, full))
    return this
  }
}
