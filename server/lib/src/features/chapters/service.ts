import { Types } from "mongoose";
import { AppError } from "../../common/app-error";
import { AppErrors } from "../../shared/errors";
import { Book } from "../books/Book";
import * as commentsService from "../comments/service";
import { Chapter, IChapter, ReadingsState } from "./Chapter";
import { ChapterAggregationBuilder } from "./chapter-aggregation-builder";


export async function getChapters(bookId: string, from: number, pageSize: number, forProfile?: string) {
  const chapters = await new ChapterAggregationBuilder(forProfile)
    .chapters(bookId)
    .page(from, pageSize)
    .build()
  return chapters
}

export async function getChapter(chapterId: string, forProfile: string) : Promise<IChapter> {
  const chapter = await Chapter.findById(chapterId)
  return chapter!
}


export async function addChapter(
  bookId: string, 
  who: string, 
  bookChapterData: { 
    name: string, 
    content: string 
  }
) : Promise<IChapter> {
  const book = await Book.findById(bookId)
  if (!book || who != book.author) {
    console.log({book, bookId})
    throw new AppError(AppErrors.cannotAddChapter, `The user with id ${who} cannot add a chapter to the book with id ${bookId}`)
  }
  const addedChapter = new Chapter({
    ...bookChapterData, 
    book: bookId
  }).save()
  return addedChapter
}


export async function updateChapter(
  chapterId: string, 
  profileId: string, 
  updates: { 
    name: string, 
    content: string 
  }
) : Promise<IChapter | null | undefined> {
  console.log({updates})
  const ch = await hasChapter(chapterId, profileId)
  if (!ch) {
    throw new AppError(AppErrors.cannotUpdateChapter, `The user with id ${profileId} cannot update a chapter with id ${chapterId}`)
  }

  await Chapter.findByIdAndUpdate(chapterId, updates)
  
  return await Chapter.findById(chapterId)
}

export async function toggleState(chapterId: string, profileId: string) {
  const ch = await hasChapter(chapterId, profileId);

  if (!ch) {
    throw new AppError(AppErrors.cannotUpdateChapter)
  }
  console.log(ch)

  const res = await Chapter.findByIdAndUpdate(chapterId, {
    state: ch.state == ReadingsState.published 
      ? ReadingsState.unpublished 
      : ReadingsState.published
  })
  if (!res) {
    throw new AppError(AppErrors.cannotUpdateChapter)
  }
  return (await Chapter.findById(chapterId))?.state

}

export async function deleteChapter(chapterId: string, profileId: string) {
  if (!await hasChapter(chapterId, profileId)) { 
    throw new AppError(AppErrors.cannotDeleteChapter)
  }
  await commentsService.deleteCommentsForSubject(chapterId)
  await Chapter.findByIdAndDelete(chapterId)
}


async function hasChapter(chapterId: string, profileId: string) : Promise<any> {
  var chapter = (await Chapter.aggregate([
    {
      $match: {
        _id: new Types.ObjectId(chapterId)
      }
    },
    {
      $lookup: {
        from: "books",
        localField: "book", 
        foreignField: "_id", 
        as: "bookDoc"
      }
    },
    { $unwind: "$bookDoc" }
  ]))[0]
  if (!chapter || profileId != chapter.bookDoc.author) return null;
  return chapter;
}