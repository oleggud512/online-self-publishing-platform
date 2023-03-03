import mongoose, { Types } from "mongoose";
import { AppError } from "../../common/app-error";
import { ReadingsState } from "../chapters/Chapter";
import { Bookmarks } from "../linking/Bookmarks";
import { BookmarksAggregationBuilder } from "../linking/bookmarks-aggregation-builder";
import { Likes } from "../linking/Likes";
import { Profile } from "../profiles/Profile";
import { Book, IBook } from "./Book";
import { BookAggregationBuilder } from "./book-aggregation-builder";
import { FilteringSource } from "./FilteringSource";
import { Filters } from "./Filters";
import { Genre } from "./Genre";
import { Tag } from "./Tag";


export async function getBook(id: string, forProfile?: string) : Promise<IBook> {
  const bookList = await new BookAggregationBuilder()
    .book(id)
    .withChapters(forProfile)
    .withAuthor(forProfile)
    .withLiked(forProfile)
    .withBookmarked(forProfile)
    .build()
  return bookList[0];
}


export async function getFilteringSource() : Promise<FilteringSource> {
  const tags: string[] = (await Tag.find()).map((t) => t.name)
  const genres: string[] = (await Genre.find()).map((t) => t.name)
  return { tags, genres }
}


export async function updateBook(id: string, book: IBook, forProfile: string) : Promise<IBook | null> {
  const updatedBook = await Book.findByIdAndUpdate(id, book)
  return getBook(updatedBook!._id, forProfile)
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
  await Profile.findByIdAndUpdate(forProfile, { $inc: { booksCount: 1 } })
  return getBook(addedBook._id, forProfile)
}


export async function hasBook(profileId: string, bookId: string) {
  const book = await Book.find({ _id: bookId, author: profileId })
  return !!book
}


export async function deleteBook(bookId: string, profileId: string) {
  await Profile.findByIdAndUpdate(profileId, { $inc: { booksCount: -1 } })
  await Book.findOneAndRemove({ _id: bookId})
  await Likes.deleteMany({ subject: bookId })
}


export async function changeState(bookId: string) {
  await Book.updateOne(
    { _id: bookId },
    [
      {
        $set: {
          state: {
            $cond: {
              if: { $eq: [ "$state", ReadingsState.published ]},
              then: ReadingsState.unpublished,
              else: ReadingsState.published,
            }
          }
        }
      }
    ]
  )
  const updatedBook = await Book.findById(bookId)
  if (!updatedBook) throw new AppError('cant-update-book-state')

  return updatedBook.state
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
    await new Likes({ subject: bookId, profile: profileId }).save()
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