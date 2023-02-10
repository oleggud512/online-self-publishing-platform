import { Request, Response, NextFunction } from 'express';
import { Book } from './Book';

export async function getAllBooks(req: Request, res: Response, next: NextFunction) {
  const limit = parseInt(req.query.limit as string, 10)
  const from = parseInt(req.query.limit as string, 10)

  try {
    let q = Book.find().limit(limit).skip(from);
    if (limit) q = q.limit(limit)
    if (from) q = q.skip(from)

    const books = await q

    return res.status(200).json({
      errors: [],
      data: {
        books
      }
    });
  } catch (error) {
    return next(error);
  }
}

export async function createBook(req: Request, res: Response, next: NextFunction) {
  const { name, description, coverUrl, tags, genres } = req.body;

  try {
    const book = await Book.create({
      name,
      description,
      coverUrl,
      tags,
      genres
    });

    return res.status(201).json({
      errors: [],
      data: {
        book
      }
    });
  } catch (error) {
    return next(error);
  }
}

export async function getBookById(req: Request, res: Response, next: NextFunction) {
  const bookId = req.params.id;

  try {
    const book = await Book.findById(bookId)
      .populate('author', '_id displayName avatarUrl')
      .populate({
        path: 'chapters',
        select: '_id name'
      })
      .populate({
        path: 'comments',
        select: '_id author content likes createdAt',
        populate: {
          path: 'author',
          select: '_id displayName avatarUrl'
        }
      });

    return res.status(200).json({
      errors: [],
      data: {
        book
      }
    });
  } catch (error) {
    return next(error);
  }
}

export async function updateBook(req: Request, res: Response) {
  const { id } = req.params;
  const updates = req.body;
  
  const book = await Book.findByIdAndUpdate(id, updates, { new: true });
  if (!book) {
    return res.status(404).json({ errors: [`Book not found with id: ${id}`] });
  }
  return res.json({ data: { book } });
}