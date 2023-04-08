import { LookupPipeline } from "../../common/types";
import { ReadingsState } from "../chapters/Chapter";
import { Filters } from "./Filters";

/**
 * фильтрует состояния. фильтрует книги 
 */
export function profileBooks(ofProfile: string, forProfile?: string) : LookupPipeline {
  let allowAllStates = forProfile && forProfile == ofProfile
  return [
    {
      $match: {
        $expr: {
          $and: [
            { $eq: [ "$author", ofProfile ]},
            ...allowAllStates
              ? []
              : [{ $eq: ["$state", ReadingsState.published]}]
          ]
        }  
      }
    }
  ]
}

export function withBookmarked(forProfile?: string) : LookupPipeline {
  return [
    {
      $lookup: {
        from: 'bookmarks',
        foreignField: 'book',
        localField: '_id',
        as: 'bookmark_docs',
        pipeline: [
          {
            $match: {
              profile: forProfile ?? ""
            }
          }
        ]
      },
    },
    {
      $addFields: {
        bookmarked: { $gt: [{ $size: "$bookmark_docs" }, 0] },
      }
    },
    { $unset: "bookmark_docs" }
  ]
}

export function filterBooks(filters: Filters) : LookupPipeline {
  console.log(filters)
  return [
    ...filters.query ? [{ 
      $search: {
        "index": "search_books", 
        "autocomplete": { 
          "query": filters.query,
          "path": "name", 
        } 
    }
    }] : [],
    { 
      $match: {
        $and: [
          {
            $expr: { $eq: ["$state", ReadingsState.published] }
          },
          {
            $expr: {
              $cond: {
                if: filters.tags.length > 0,
                then: { $gt: [ 
                  { $size: { $setIntersection: ["$tags", filters.tags] } }, 
                  0 
                ] },
                else: { }
              }
            }
          },
          {
            $expr: {
              $cond: {
                if: filters.genres.length > 0,
                then: { $gt: [ 
                  { $size: { $setIntersection: ["$genres", filters.genres] } }, 
                  0 
                ] },
                else: { }
              }
            }
          },
          {
            $expr: { $in: [ "$status", filters.statuses ] }
          }

        ]
      }
    },
    // attempt to create best match sorting
    { 
      $addFields: {
        tagMatchCount: { $size: { $setIntersection: ["$tags", filters.tags] } },
        genreMatchCount: { $size: { $setIntersection: ["$genres", filters.genres] } }
      }
    },
    { 
      $addFields: {
        tagMatchPercent: {
          $cond: {
            if: { $gt: [ { $size: "$tags" }, 0 ] },
            then: { $divide: ["$tagMatchCount", { $size: "$tags" }] },
            else: "$tagMatchCount"
          }
        },
        genreMatchPercent: {
          $cond: {
            if: { $gt: [ { $size: "$genres" }, 0 ] },
            then: { $divide: ["$genreMatchCount", { $size: "$genres" }] },
            else: "$genreMatchCount"
          }
        }
      }
    },
    { 
      $addFields: {
        totalScore: { $add: [
          // "$searchScore", 
          "$tagMatchPercent", 
          "$genreMatchPercent"
        ] }
      }
    },
    { 
      $sort: {
        totalScore: -1
      }
    }
  ]
}
