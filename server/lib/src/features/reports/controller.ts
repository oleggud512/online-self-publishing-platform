import { NextFunction, Request, Response } from "express";
import { AppError } from "../../common/app-error";
import { promise } from "../../common/error-handling";
import { parsePaginationQuery } from "../../common/parse-pagination-query";
import { AppErrors } from "../../shared/errors";
import { Sorting } from "../comments/Sorting";
import * as reportService from "./service";


export async function getTypes(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const subjectName = req.query.subjectName as string | undefined;

  reportService
    .getReportTypes(subjectName)
    .then((types) => {
      res.json({ data: types });
    })
    .catch(next);
}


export async function addReport(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const author = res.locals.uid;
  if (author != req.body.author)
    return next(new AppError("author doesn't equal the user inside JVT"))
  const subject = req.body.subject as string | undefined;
  if (!subject)
    return next(new AppError(AppErrors.missingField, "subject is required"))
  const subjectName = req.body.subjectName as string | undefined;
  if (!subjectName)
    return next(new AppError(AppErrors.missingField, "subjectName is requried"))
  const reportType = req.body.reportType as string | undefined;
  if (!reportType)
    return next(new AppError(AppErrors.missingField, "reportType is required"))
  const defendant = req.body.defendant as string | undefined;
  if (!defendant)
    return next(new AppError(AppErrors.missingField, "defendant is required"))
  const description = req.body.description as string | undefined;
  if (!description)
    return next(new AppError(AppErrors.missingField, "description is required"))

  reportService
    .addReport(author, subject, subjectName, reportType, defendant, description)
    .then((added) => {
      res.json({ data: added });
    })
    .catch(next);
}


export async function getReports(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const { from, pageSize } = parsePaginationQuery(req.query);
  const subjectName = req.query.subjectName as string | undefined; // Book, Profile, Comment
  const state = req.query.state as string; // pending, inProgress, closed
  const sorting = req.query.sorting as string;
  const owner = req.query.owner as string; // my, all
  const forProfile = res.locals.uid as string;

  console.log({ state, sorting, owner, subjectName, forProfile });

  reportService
    .getReports(
      subjectName,
      state,
      owner,
      sorting as Sorting,
      forProfile,
      from,
      pageSize
    )
    .then((reports) => {
      console.log(reports.length);
      res.json({ data: reports });
    })
    .catch(next);
}


export async function getReport(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reportId = req.params.id;

  reportService
    .getReport(reportId)
    .then((report) => {
      res.json({ data: report });
    })
    .catch(next);
}


export async function takeReport(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const adminId = res.locals.uid;
  const reportId = req.params.id;

  const [report, error] = await promise(
    reportService.takeReport(adminId, reportId)
  );
  if (error) return next(error);
  return res.json({ data: report });
}


export async function closeReport(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const adminId = res.locals.uid;
  const reportId = req.params.id;

  const [report, error] = await promise(reportService.closeReport(reportId));
  if (error) return next(error);
  return res.json({ data: report });
}


export async function openReport(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const adminId = res.locals.uid
  const reportId = req.params.id

  const [ report, error ] = await promise(reportService.openReport(reportId))
  if (error) return next(error)
    return res.json({ data: report })
}


export async function rejectReport(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const adminId = res.locals.uid;
  const reportId = req.params.id;

  const [report, error] = await promise(reportService.rejectReport(reportId));

  if (error) return next(error);
  return res.json({ data: report });
}


export async function addMessageAction(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const reportId = req.params.id;
  const profileId = res.locals.uid;

  const content = req.body.content as string;

  const [message, error] = await promise(
    reportService.addMessageAction(reportId, profileId, content)
  );
  if (error) return next(error);
  return res.json({ data: message });
}


export async function getChats(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const profileId = res.locals.uid;
  const { from, pageSize } = parsePaginationQuery(req.query);

  const [chats, error] = await promise(
    reportService.getChats(profileId, from, pageSize)
  );
  if (error) return next(error);
  return res.json({ data: chats });
}


export async function getMessages(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const profileId = res.locals.uid;
  const reportId = req.params.id;
  const { from, pageSize } = parsePaginationQuery(req.query);

  const [messages, error] = await promise(
    reportService.getMessages(reportId, profileId, from, pageSize)
  );
  if (error) return next(error);
  return res.json({ data: messages });
}
