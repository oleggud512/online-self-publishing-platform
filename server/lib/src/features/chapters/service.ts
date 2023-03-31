import { PopulateOptions, Types } from "mongoose";
import { AppError } from "../../common/app-error";
import { AppErrors } from "../../shared/errors";
import { Book } from "../books/Book";
import * as commentsService from "../comments/service";
import { Chapter, IChapter, ReadingsState } from "./Chapter";
import { ChapterAggregationBuilder } from "./chapter-aggregation-builder";
import * as actionService from "../reports/action-service"
import { ActionType } from "../reports/Action";
import { Constants } from "../../shared/Constants";
import { authorPopulateOption } from "../profiles/profile-query-utils";
import { chapterPopulateOptions } from "./chapter-query-utils";
import * as notificationService from "../notifications/service"


export async function getChapters(bookId: string, from: number, pageSize: number, forProfile?: string) {
  const chapters = await new ChapterAggregationBuilder(forProfile)
    .chapters(bookId)
    .page(from, pageSize)
    .build()
  return chapters
}


export async function getChapter(chapterId: string, forProfile: string) : Promise<IChapter> {
  const chapter = await Chapter.findById(chapterId).populate(chapterPopulateOptions)
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
  const addedChapter = await new Chapter({
    ...bookChapterData, 
    book: bookId
  }).save()
  actionService.addBookUpdated({
    actionType: ActionType.addChapter,
    authorId: who,
    bookId: addedChapter.book as string,
    chapterId: addedChapter._id
  })
  return await addedChapter.populate(chapterPopulateOptions)
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

  // await Chapter.findByIdAndUpdate(chapterId, updates)
  const up = await Chapter.updateOne({ _id: chapterId }, updates)
  if (up.acknowledged && up.modifiedCount > 0) {
    actionService.addBookUpdated({
      actionType: ActionType.updateChapter,
      authorId: profileId,
      bookId: ch.book as string,
      chapterId: chapterId
    })
  }
  
  return await Chapter.findById(chapterId).populate(chapterPopulateOptions)
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
  const updatedChapter = await Chapter.findById(chapterId)

  if (!updatedChapter) throw "can't find updatedChapter"

  if (updatedChapter.state == ReadingsState.published) {
    notificationService.sendNewChapterNotification(updatedChapter._id)
  }

  actionService.addBookUpdated({
    actionType: updatedChapter!.state == ReadingsState.published 
      ? ActionType.publishChapter
      : ActionType.unpublishChapter,
    authorId: profileId,
    bookId: updatedChapter.book as string,
    chapterId: updatedChapter._id
  })
  
  return updatedChapter.state

}

export async function deleteChapter(chapterId: string, profileId: string) {
  if (!await hasChapter(chapterId, profileId)) { 
    throw new AppError(AppErrors.cannotDeleteChapter)
  }
  await commentsService.deleteCommentsForSubject(chapterId)
  const del = await Chapter.findByIdAndDelete(chapterId)
  if (!del) throw 'chapter have not been deleted'
  actionService.addBookUpdated({
    actionType: ActionType.deleteChapter,
    authorId: profileId,
    bookId: del.book as string,
    chapterId: chapterId
  })
}


async function hasChapter(chapterId: string, profileId: string) : Promise<IChapter | null> {
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
  if (!chapter || profileId != chapter.bookDoc.author) return null
  return chapter
}