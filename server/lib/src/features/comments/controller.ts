import { NextFunction, Request, Response } from "express";
import { parsePaginationQuery } from "../../common/parse-pagination-query";
import { Sorting } from "./Sorting";
import * as commentsService from "./service"
import { promise } from "../../common/error-handling";
import { AppError } from "../../common/app-error";
import { AppErrors } from "../../shared/errors";
import { parseBool, tryParseBool } from "../../common/parse-bool";
import { Role } from "../users/models/Role";


export async function getComments(req: Request, res: Response, next: NextFunction) {
  const { from, pageSize } = parsePaginationQuery(req.query)
  const whoTriesToGetComments = res.locals.uid as string | undefined
  const subjectId = req.query.subjectId as string | undefined
  const sorting = req.query.sorting as Sorting | undefined
  const questionId = req.query.questionId as string | undefined
  const full = tryParseBool(req.query.full as string | undefined) ?? false

  if (!(questionId || subjectId)) return next(new AppError(AppErrors.missingField, 'questionId or subjectId is required'))
  console.log(full)
  const [comments, error] = await promise(commentsService.getComments({
    subjectId, 
    questionId, 
    full,
    sorting, 
    from, 
    pageSize, 
    forProfile: whoTriesToGetComments
  }));
  if (error) return next(error)

  return res.json({ data: comments })

}

export async function addComment(req: Request, res: Response, next: NextFunction) {
  const questionId = req.query.questionId as string | undefined
  const subjectId = req.query.subjectId as string // required
  const subjectName: string = req.query.subjectName as string // required

  const content = req.body.content as string
  
  const whoTriesToAddComment = res.locals.uid as string

  const [comment, error] = await promise(commentsService.addComment({
    ofProfile: whoTriesToAddComment, 
    content,
    subjectId,
    subjectName,
    questionId,
  }))
  console.log(comment)
  if (error) return next(error)
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

  var deleted: boolean 

  if ((['admin', 'super-admin'] as Role[]).includes(res.locals.role)) { 
    console.log('DELETE ALL COMMENTS')
    deleted = await commentsService.deleteCommentAdmin(id, whoTriesToDeleteComment)
    console.log({ adm: deleted})
  } else {
    deleted = await commentsService.deleteComment(id, whoTriesToDeleteComment)
  }


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
