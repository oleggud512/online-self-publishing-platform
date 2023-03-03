import { NextFunction, Request, Response } from "express";
import { AppError } from "../../common/app-error";
import { parsePaginationQuery } from "../../common/parse-pagination-query";
import * as chatService from "./service"


export async function getChats(req: Request, res: Response, next: NextFunction) {
  const forProfile = res.locals.uid as string
  const { from, pageSize } = parsePaginationQuery(req.query)

  const chats = await chatService.getChats(forProfile, from, pageSize)
  console.log(chats)
  res.json({ data: chats })
}


export async function getMessages(req: Request, res: Response, next: NextFunction) {
  const forProfile = res.locals.uid as string
  const other = req.params.id 
  const { from, pageSize } = parsePaginationQuery(req.query)

  const messages = await chatService.getMessages(forProfile, other, from, pageSize)

  res.json({ data: messages })
}


export async function addMessage(req: Request, res: Response, next: NextFunction) {
  const { from, to, content } = req.body

  if (!from) return next(new AppError("no-from"))
  if (!to) return next(new AppError("no-to"))
  if (!content) return next(new AppError("no-content"))

  const message = await chatService.addMessage(from, to, content)

  return res.json({ data: message })
}