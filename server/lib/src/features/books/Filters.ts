import { BookStatus } from "./Book";

export class Filters {
  query?: string
  tags: string[] = []
  genres: string[] = []
  statuses: string[] = [
    BookStatus.abandoned, 
    BookStatus.completed, 
    BookStatus.inProgress
  ]

  static fromQuery(query: any, forProfile: string | undefined) {
    const { query: queryStr, tags, genres, statuses } = query;
    
    var filters: Filters = new Filters();

    if (query) {
      filters.query = queryStr as string;
    }

    if (tags) {
      filters.tags = (Array.isArray(tags) ? tags : [tags]) as string[];
    }

    if (genres) {
      filters.genres = (Array.isArray(genres) ? genres : [genres]) as string[];
    }

    if (statuses) {
      filters.statuses = (Array.isArray(statuses) ? statuses : [statuses]) as string[];
    }
    return filters
  }
}