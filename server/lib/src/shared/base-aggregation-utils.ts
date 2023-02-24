import { LookupPipeline } from "../common/types";

export function page(from: number, pageSize: number) : LookupPipeline {
  return [
    {
      $skip: from
    },
    {
      $limit: pageSize
    }
  ]
}