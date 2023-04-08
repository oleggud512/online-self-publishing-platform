import { NextFunction, Request, Response } from "express";
import { AppError } from "../../common/app-error";
import { promise } from "../../common/error-handling";
import { tryParseBool } from "../../common/parse-bool";
import { parsePaginationQuery } from "../../common/parse-pagination-query";
import { Filters } from "./Filters";
import * as bookService from "./service"


export async function getBook(req: Request, res: Response, next: NextFunction) {
  const bookId = req.params.id
  // allChapters == false ==> retrieve all published book chapters else only last 5
  const allChapters = tryParseBool(req.query.allChapters as string | undefined) ?? false
  const forProfile = res.locals.uid

  const book = await bookService.getBook(bookId, forProfile, allChapters);
  return res.json({ data: book })
}


export async function getFilteringSource(req: Request, res: Response, next: NextFunction) {
  const source = await bookService.getFilteringSource()
  return res.json({ data: source })
}


export async function deleteBook(req: Request, res: Response, next: NextFunction) {
  const bookIdToDelete = req.params.id
  const whoTriesToDelete = res.locals.uid

  if (!(await bookService.hasBook(whoTriesToDelete, bookIdToDelete))) {
    return res.json({ data: false })
  }
  await bookService.deleteBook(bookIdToDelete, whoTriesToDelete)
  return res.json({ data: true })
}


export async function updateBook(req: Request, res: Response, next: NextFunction) {
  const whatToUpdate = req.params.id
  const updates = req.body
  console.log(`UPDATING THE BOOOOOOOOK`)
  console.log(updates)
  const whoTriesToUpdate = res.locals.uid!;
  const updatedBook = await bookService.updateBook(whatToUpdate, updates, whoTriesToUpdate);
  if (!updatedBook) return next(new AppError('update-book-error'))
  return res.json({ data: updatedBook })
}


export async function getBooks(req: Request, res: Response, next: NextFunction) {
  console.log(req.query)
  console.log(`uid ${res.locals.uid}`)
  const { from, pageSize } = parsePaginationQuery(req.query)
  const forProfile = res.locals.uid
  const ofProfile = req.query.ofProfile as string | undefined

  if (req.query.ids) {
    console.log("req.query.ids")
    var ids = (Array.isArray(req.query.ids) ? req.query.ids : [req.query.ids]) as string[]
    const books = await bookService.getBooksByIds(ids, from, pageSize, forProfile)
    return res.json({ data: books })
  }
  
  if (ofProfile) {
    const books = await bookService.getProfileBooks(
      ofProfile, 
      from, 
      pageSize, 
      forProfile)
    return res.json({ data: books })
  }

  const filters = Filters.fromQuery(req.query, res.locals.uid);
  const books = await bookService.getBooks(filters, from, pageSize, forProfile)
  console.log(books)
  res.json({ data: books })
}


export async function getPopularBooks(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const { from, pageSize } = parsePaginationQuery(req.query)
  const forProfile = res.locals.uid

  const [ books, error ] = 
    await promise(bookService.getPopularBooks(from, pageSize))

  if (error) return next(error)
  return res.json({ data: books })
}


export async function addBook(req: Request, res: Response, next: NextFunction) {
  const newBook = req.body
  const forProfile = res.locals.uid as string
  console.log({ message: "addBook", newBook, forProfile})

  if (!newBook.author || !forProfile || newBook.author != forProfile) {
    return next(new AppError("add-book-error"))
  }
  console.log(newBook)
  bookService.addBook(newBook, forProfile).then(book => {
    res.json({ data: book })
  })
}


export async function changeState(req: Request, res: Response, next: NextFunction) {
  const bookId = req.params.id
  const whoTriesToChangeState = res.locals.uid

  if (!(await bookService.hasBook(whoTriesToChangeState, bookId))) {
    return next(new AppError('cant-edit-others-books'))
  }

  const [newReadingsState, error] = await promise(bookService.changeState(bookId))
  if (error) return next(error)
  return res.json({ data: newReadingsState })
}


export async function toggleLike(req: Request, res: Response, next: NextFunction) {
  const bookId = req.params.id
  const whoTriesToLike = res.locals.uid

  if (!whoTriesToLike) 
    return res.json({ data: false })

  const toggled = await bookService.toggleLike(bookId, whoTriesToLike)

  return res.json({ data: toggled })
}


export async function toggleBookmark(req: Request, res: Response, next: NextFunction) {
  const bookId = req.params.id
  const whoTriesToBookmark = res.locals.uid

  if (!whoTriesToBookmark)
    return res.json({ data: false })
  
  const toggled = await bookService.toggleBookmark(bookId, whoTriesToBookmark)
  console.log(`bookmark toggled - ${toggled}`)

  return res.json({ data: toggled })
}


export async function getPermissions(
  req: Request, 
  res: Response, 
  next: NextFunction
) {
  const bookId = req.params.id

  const [permissions, error] = await promise(bookService.getPermissions(bookId))

  if (error) return next(error)

  return res.json({ data: permissions })
}


export async function togglePublish(
  req: Request, 
  res: Response, 
  next: NextFunction
) {
  const bookId = req.params.id
  const adminId = res.locals.uid

  const [publishBook, error] = 
    await promise(bookService.togglePublish(bookId, adminId))

  if (error) return next(error)

  return res.json({ data: publishBook })
}
