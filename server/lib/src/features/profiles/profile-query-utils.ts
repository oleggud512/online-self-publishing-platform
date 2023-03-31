import { PopulateOptions } from "mongoose";
import { Constants } from "../../shared/Constants";

export const authorPopulateOption: PopulateOptions = {
  path: "author",
  select: Constants.profileSelectMin
}