import mongoose, { Types } from "mongoose"
import { AppError } from "../../common/app-error"
import { ReadingsState } from "../chapters/Chapter"
import { Bookmarks } from "../linking/Bookmarks"
import { Likes } from "../linking/Likes"
import { Profile } from "../profiles/Profile"
import { Book, BookStatus, IBook } from "./Book"
import { BookAggregationBuilder } from "./book-aggregation-builder"
import { FilteringSource } from "./FilteringSource"
import { Filters } from "./Filters"
import { Genre } from "./Genre"
import { Tag } from "./Tag"
import * as actionService from "../reports/action-service"
import { ActionType } from "../reports/Action"
import { AppErrors } from "../../shared/errors"
import * as reportService from "../reports/service"
import * as notificationService from "../notifications/service"
import { Report, ReportState } from "../reports/Report"
import * as restrictionService from "../restrictions/service"
import { Restriction } from "../restrictions/Restriction"
import { BookPermissions } from "./BookPermissions"


export async function getBook(id: string, forProfile?: string, allChapters?: boolean) : Promise<IBook> {
  const bookList = await new BookAggregationBuilder()
    .book(id)
    .withChapters(forProfile, Boolean(allChapters))
    .withAuthor(forProfile)
    .withLiked(forProfile)
    .withBookmarked(forProfile)
    .build()
  console.log({getBook: bookList, chapters: bookList[0].chapters})

  return bookList[0]
}

export async function getFilteringSource() : Promise<FilteringSource> {
  const tags: string[] = (await Tag.find()).map((t) => t.name)
  const genres: string[] = (await Genre.find()).map((t) => t.name)
  return { tags, genres }
}


export async function updateBook(id: string, book: IBook, forProfile: string) : Promise<IBook | null> {
  // const updatedBook = await Book.findByIdAndUpdate(id, book)
  const upd = await Book.updateOne({ _id: id }, book)
  if (upd.acknowledged && upd.modifiedCount > 0) {
    console.log("SHALL ADD ACTION!!!")
    actionService.addBookUpdated({
      actionType: ActionType.updateBook,
      authorId: forProfile, 
      bookId: id
    })
  }
  return getBook(id, forProfile)
}


export async function getBooks(
  filters: Filters, 
  from: number, 
  pageSize: number, 
  forProfile?: string
) : Promise<IBook[]> {
  console.log('getBooks:')
  console.log({from, pageSize, filters, forProfile})
  const books = await new BookAggregationBuilder()
    .books(filters)
    .withAuthor(forProfile)
    .withBookmarked(forProfile)
    .page(from, pageSize)
    .build()
  return books
}


export async function getPopularBooks(
  from: number, 
  pageSize: number, 
  forProfile?: string
) {
  const books = await new BookAggregationBuilder()
    .popularBooks()
    .withAuthor(forProfile)
    .withBookmarked(forProfile)
    .page(from, pageSize)
    .build()
  console.log({popularBooks: books})
  return books
}


export async function getProfileBooks(
  ofProfile: string, 
  from: number, 
  pageSize: number, 
  forProfile?: string
) {
  const books = await new BookAggregationBuilder()
    .profileBooks(ofProfile, forProfile)
    .withAuthor(forProfile) 
    .withBookmarked(forProfile)
    .page(from, pageSize)
    .build()
  return books
}


export async function addBook(book: IBook, forProfile: string) : Promise<IBook> {
  const bookToAdd = new Book({
    name: book.name,
    description: book.description,
    author: book.author,
    tags: book.tags,
    genres: book.genres,
    status: book.status
  })
  const addedBook = await bookToAdd.save()
  actionService.addBookUpdated({
    actionType: ActionType.addBook, 
    authorId: forProfile, 
    bookId: addedBook._id
  })
  return getBook(addedBook._id, forProfile)
}


export async function hasBook(profileId: string, bookId: string) {
  const book = await Book.find({ _id: bookId, author: profileId })
  return !!book
}


export async function deleteBook(bookId: string, profileId: string) {
  Book.findById(bookId).exec((_, book) => {
    if (!book || book.state != ReadingsState.published) return;
    Profile.findByIdAndUpdate(profileId, { $inc: { booksCount: -1 } }).exec()
  })
  await Book.findOneAndRemove({ _id: bookId })
  await Likes.deleteMany({ subject: bookId })
  await Report.updateMany({ 
    subject: bookId, 
    state: ReportState.inProgress 
  }, { 
    state: ReportState.closed 
  })
  actionService.addBookUpdated({
    actionType: ActionType.deleteBook,
    authorId: profileId,
    bookId: bookId
  })
}


export async function changeState(bookId: string) : Promise<String> {
  const book = await Book.findById(bookId)

  if (!book) {
    throw new AppError(AppErrors.cannotChangeState)
  }

  const bookRestrictions = await restrictionService.getRestrictions(book!._id)
  if (bookRestrictions.find(r => r.restriction == Restriction.Name.publishBook)) {
    throw new AppError(AppErrors.cannotChangeState)
  }
  const profileRestrictions = 
    await restrictionService.getRestrictions(book.author as string);
  if (profileRestrictions.find(r => r.restriction == Restriction.Name.publishBook && 
      book.state == ReadingsState.unpublished)) {
    throw new AppError(AppErrors.cannotChangeState)
  }

  book.state = book.state == ReadingsState.published 
    ? ReadingsState.unpublished 
    : ReadingsState.published
  await book.save()
  Profile.updateOne({ _id: book.author }, { 
    $inc: { 
      booksCount: book.state == ReadingsState.published ? 1 : -1
    } 
  }).exec()
  
  actionService.addBookUpdated({
    actionType: book.state == ReadingsState.published 
      ? ActionType.publishBook
      : ActionType.unpublishBook,
    authorId: book.author as string,
    bookId: book._id
  })
  
  return book.state
}


export async function toggleLike(bookId: string, profileId: string) 
    : Promise<boolean> {
  const likeEntity = await Likes.findOne({ subject: bookId, profile: profileId })

  if (likeEntity && likeEntity.active) {
    // unlike - make active = false
    await Likes.findOneAndUpdate({ subject: bookId, profile: profileId }, { active: false })
    await Book.findByIdAndUpdate(bookId, { $inc: { likes: -1 } })
    return true
  } 

  if (!likeEntity) {
    // like - create a new like entity
    await new Likes({ subject: bookId, profile: profileId, subjectName: 'Book' }).save()
  } else if (!likeEntity!.active) {
    // like - just make active = true and that's all. 
    await Likes.findOneAndUpdate({ subject: bookId, profile: profileId }, { active: true })
  }
  await Book.findByIdAndUpdate(bookId, { $inc: { likes: 1 } })
  return true
}


export async function toggleBookmark(bookId: string, profileId: string) 
    : Promise<boolean> {
  const bookmark = await Bookmarks.findOne({ profile: profileId, book: bookId })
  if (bookmark) {
    await bookmark.delete()
    console.log("toggle delete")
    return true
  }
  await new Bookmarks({ profile: profileId, book: bookId }).save()
  console.log("toggled")
  return true
}


export async function getBooksByIds(
  ids: string[], 
  from: number = 0,
  pageSize: number = 20, 
  forProfile?: string
) : Promise<IBook[]> {
  const books = await new BookAggregationBuilder()
    .booksByIds(ids)
    .withAuthor(forProfile)
    .withBookmarked(forProfile)
    .page(from, pageSize)
    .build()
  console.log(books)
  return books
}

export async function getPermissions(bookId: string) {
  const restrictions = await restrictionService.getRestrictions(bookId)

  const publishBookRestriction = Boolean(restrictions.find(
    r => r.restriction == Restriction.Name.publishBook
  ))

  // if there is publishBook restrition, it means that book publication is not permitted.
  
  return new BookPermissions({ 
    publishBook: !publishBookRestriction
  })
}

export async function togglePublish(bookId: string, adminId: string, before?: Date) {
  const canPublishBook = await restrictionService.toggleRestriction({
    subject: bookId,
    subjectName: Restriction.Subject.book,
    restriction: Restriction.Name.publishBook,
    before
  })


  actionService.addBookUpdated({
    actionType: canPublishBook 
      ? ActionType.publishBookPermanently 
      : ActionType.unpublishBookPermanently, 
    bookId: bookId,
    authorId: adminId
  })

  const book = await Book.findById(bookId)

  if (!canPublishBook && book) {
    book.state = ReadingsState.unpublished
    await book.save()
    notificationService.sendBookUnpublishedNotification(book)
  } else if (!book) {
    console.log('CANNOT GET BOOK')
  }

  return canPublishBook
}

export async function syncScore() {
  const res = await Book.updateMany({}, [{
    $set: { score: { $add: [ 
      { $ifNull: [ "$bookCount", 0 ] },
      { $ifNull: [ "$views", 0 ] },
      { $ifNull: [ "$likes", 0 ] }
    ] } }
  }])
  console.log({ message: 'SYNCED', res })
}
