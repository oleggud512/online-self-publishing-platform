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

  return [
    {
      $lookup: {
        ...lookup,
        as: lookupDoc,
      }
    },
    { $unwind: `$${lookupDoc}` },
    {
      $addFields: {
        [lookup.as]: {
          $cond: {
            if: { $isArray: `$${lookupDoc}` },
            then: `$${lookup.localField}`,
            else: `$${lookupDoc}`
          }
        }
      }
    },
    { $unset: lookupDoc }
  ]
}