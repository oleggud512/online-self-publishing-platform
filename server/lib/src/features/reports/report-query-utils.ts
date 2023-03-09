import { PopulateOptions } from "mongoose";
import { Constants } from "../../shared/Constants";


export const smallReportPopulateOptions: PopulateOptions[] = [
  { path: "author", select: Constants.profileSelectMin },
  { path: "admin", select: Constants.profileSelectMin },
  {
    path: "reportType",
    localField: 'reportType',
    foreignField: 'name',
    justOne: true
  },
  {
    path: "subject",
    populate: [
      { path: "author", select: Constants.profileSelectMin },
      { path: "subject" },
    ],
  }
]


export const fullReportPopulateOptions: PopulateOptions[] = [
  { path: "actions" },
  ...smallReportPopulateOptions
]
