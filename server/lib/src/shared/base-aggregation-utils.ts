import { PipelineStage } from "mongoose";
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

/**
 * оборачивает lookup так чтобы он присваивал в as первый елемент массива, если не получится то ничего не делать.
 */
export function tryLookup(lookup: PipelineStage.Lookup['$lookup']) : LookupPipeline {
  const lookupDoc = 'tryLookupDoc'
  const tempDoc = lookup.as + lookupDoc

  return [
    {
      $lookup: {
        ...lookup,
        as: tempDoc,
      }
    },
    { $unwind: `$${tempDoc}` },
    {
      $addFields: {
        [lookup.as]: {
          $cond: {
            if: { $isArray: `$${tempDoc}` },
            then: `$${lookup.localField}`,
            else: `$${tempDoc}`
          }
        }
      }
    },
    { $unset: tempDoc }
  ]
}