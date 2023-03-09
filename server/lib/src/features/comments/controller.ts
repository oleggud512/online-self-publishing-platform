import { NextFunction, Request, Response } from "express";
import { parsePaginationQuery } from "../../common/parse-pagination-query";
import { Sorting } from "./Sorting";
import * as commentsService from "./service"


export async function getComments(req: Request, res: Response, next: NextFunction) {
  const { from, pageSize } = parsePaginationQuery(req.query)
  const whoTriesToGetComments = res.locals.uid as string | undefined
  const subjectId = req.query.subjectId as string | undefined
  const sorting = req.query.sorting as Sorting | undefined
  const questionId = req.query.questionId as string | undefined

  const comments = await commentsService.getComments({
    subjectId, 
    questionId, 
    sorting, 
    from, 
    pageSize, 
    forProfile: whoTriesToGetComments
  });

  return res.json({ data: comments })

}

export async function addComment(req: Request, res: Response, next: NextFunction) {
  const questionId = req.query.questionId as string | undefined
  const subjectId = req.query.subjectId as string // required
  const subjectName: string = req.query.subjectName as string // required

  const content = req.body.content as string
  
  const whoTriesToAddComment = res.locals.uid as string

  const comment = await commentsService.addComment({
    ofProfile: whoTriesToAddComment, 
    content,
    subjectId,
    subjectName,
    questionId,
  })
  console.log(comment)
  return res.json({ data: comment })
}

export async function updateComment(req: Request, res: Response, next: NextFunction) {
  const id = req.params.id
  const content = req.body.content
  const whoTriesToUpdateComment = res.locals.uid as string
  commentsService.updateComment(
    {id, content},
    whoTriesToUpdateComment
  ).then(comment => {
    res.json({ data: comment })
  }).catch(next)
}

export async function deleteComment(req: Request, res: Response, next: NextFunction) {
  const id = req.params.id
  const whoTriesToDeleteComment = res.locals.uid as string

  const deleted = await commentsService.deleteComment(id, whoTriesToDeleteComment)

  return res.json({ data: deleted })
}

export async function rateComment(req: Request, res: Response, next: NextFunction) {
  const rate = parseInt(req.query.rate as string)
  const commentId = req.params.id
  const whoTriesToRateComment = res.locals.uid as string

  const newRates = await commentsService.rateComment(commentId, whoTriesToRateComment, rate)
  
  return res.json({ data: newRates })
  // just rate on conditions
}