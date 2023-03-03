import { NextFunction, Request, Response } from "express"
import { AppError } from "../../common/app-error"
import { AppErrors } from "../../shared/errors"

import * as reportService from "./service"

export async function getTypes(req: Request, res: Response, next: NextFunction) {
  const subjectName = req.query.subjectName as string | undefined

  reportService.getReportTypes(subjectName)
    .then(types => {
      res.json({ data: types })
    })
    .catch(next)
}

export async function addReport(req: Request, res: Response, next: NextFunction) {
  const author = res.locals.uid
  if (author != req.body.author) return next(new AppError("author doesn't equal the user inside JVT"))
  const subject = req.body.subject as string | undefined
  if (!subject) return next(new AppError(AppErrors.missedField, "subject is required"))
  const subjectName = req.body.subjectName as string | undefined
  if (!subjectName) return next(new AppError(AppErrors.missedField, "subjectName is requried"))
  const reportType = req.body.reportType as string | undefined
  if (!reportType) return next(new AppError(AppErrors.missedField, "reportType is required"))


  reportService.addReport(author, subject, subjectName, reportType)
    .then(added => {
      res.json({ data: added })
    })
    .catch(next)
}