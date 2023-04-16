import { PopulateOptions } from "mongoose";
import { Constants } from "../../shared/Constants";
import { Chapter } from "../chapters/Chapter";


export const smallReportPopulateOptions: PopulateOptions[] = [
  { path: "author", select: Constants.profileSelectMin },
  { path: "admin", select: Constants.profileSelectMin },
  { path: "defendant", select: Constants.profileSelectMin },
  {
    path: "reportType",
    localField: 'reportType',
    foreignField: 'name',
    justOne: true
  },
  // book, comment, profile
  {
    path: "subject",
    populate: [
      // for book, comment
      { path: "author", select: Constants.profileSelectMin },
      // for comment (profile)
      { path: "subject" },
    ],
  }
]

export const actionPopulateOptions: PopulateOptions[] = [
  { path: "author", select: Constants.profileSelectMin },
  { path: "profile", select: Constants.profileSelectMin },
  { path: "book", select: "_id name" },
  { path: "chapter", select: "_id name", model: Chapter },
]


export const fullReportPopulateOptions: PopulateOptions[] = [
  { 
    path: "actions", 
    populate: actionPopulateOptions,
    options: { sort: { content: -1 } } 
  },
  ...smallReportPopulateOptions,
]
