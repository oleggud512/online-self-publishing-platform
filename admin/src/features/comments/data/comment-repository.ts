import { HttpClient } from "aurelia-fetch-client";
import { Sorting } from "features/reports/domain/sorting";
import { Constants } from "shared/constants";
import { Comment } from "../domain/comment";
import qs from "qs"

export class CommentRepository {
  constructor(private client: HttpClient) { }

  async getComments(subjectId: string, args: {
    sorting?: Sorting
    questionId?: string
    from?: number
    pageSize?: number
  }) {
    const queryParams = qs.stringify({
      subjectId: subjectId,
      sorting: args.sorting ?? 'old',
      questionId: args.questionId,
      full: true,
      from: args.from ?? 0,
      pageSize: args.pageSize ?? Constants.defaultPageSize,
    })
    const resp = await this.client.fetch(`comments?${queryParams}`, {
      method: 'GET'
    })
    const json = await resp.json()
    // console.log({commentsJson: json})
    if (json.error)  {
      console.log(json)
      throw json.error
    }
    const comments = (json.data as any[]).map(c => new Comment(c))
    return comments
  }

  async deleteComment(commentId: string) : Promise<boolean> {
    const resp = await this.client.fetch(`comments/${commentId}`, {
      method: 'DELETE'
    })
    const json = await resp.json()
    return json.data as boolean
  }
}
