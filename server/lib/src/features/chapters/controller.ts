import { NextFunction, Request, Response } from "express";
import { parsePaginationQuery } from "../../common/parse-pagination-query";
import * as chaptersService from "./service"

export async function getChapters(req: Request, res: Response, next: NextFunction) {
  const { from, pageSize } = parsePaginationQuery(req.query)
  const bookId = req.query.bookId as string
  const forProfile = res.locals.uid as string | undefined

  chaptersService.getChapters(bookId, from, pageSize, forProfile)
    .then(chapters => {
      res.json({ data: chapters })
    })
    .catch(next)
}

export async function getChapter(req: Request, res: Response, next: NextFunction) {
  const forProfile = res.locals.uid
  const chapterId = req.params.id

  chaptersService.getChapter(chapterId, forProfile)
    .then(chapter => {
      res.json({ data: chapter })
    })
    .catch(next)

}

export async function addChapter(req: Request, res: Response, next: NextFunction) {
  console.log({ "req.body": req.body, "res.locals": res.locals})
  const bookId = req.body.book as string
  const whoTriesToAddChapter = res.locals.uid as string
  const newChapterData = {
    content: req.body.content,
    name: req.body.name
  }

  chaptersService.addChapter(bookId, whoTriesToAddChapter, newChapterData)
    .then(chapter => {
      res.json({ data: chapter })
    })
    .catch(next)
}

export async function updateChapter(req: Request, res: Response, next: NextFunction) {
  const profileId = res.locals.uid as string
  const updates = {
    content: req.body.content,
    name: req.body.name
  }
  const chapterId = req.params.id

  console.log({"req.body": req.body})

  chaptersService.updateChapter(chapterId, profileId, updates)
    .then(chapter => {
      console.log(chapter)
      res.json({ data: chapter })
    }).catch(next)

}

export async function deleteChapter(req: Request, res: Response, next: NextFunction) {
  const profileId = res.locals.uid as string
  const chapterId = req.params.id

  chaptersService.deleteChapter(chapterId, profileId)
    .then(() => res.json({ data: true }))
    .catch(() => res.json({ data: false }))

} 

export async function toggleState(req: Request, res: Response, next: NextFunction) {
  const profileId = res.locals.uid as string
  const chapterId = req.params.id

  await chaptersService.toggleState(chapterId, profileId)
    .then(newState => {
      res.json({ data: newState })
    })
    .catch(next)
  
}