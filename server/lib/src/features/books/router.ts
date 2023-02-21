import express from 'express';
import { couldBeAuthenticated, isAuthenticated } from '../auth/authenticated';
import * as booksController from './controller'

const router = express.Router();

router.get('/',
  couldBeAuthenticated,
  booksController.getBooks
)

router.post('/',
  isAuthenticated,
  booksController.addBook
)

/**
 * returns tags and genres
 */
router.get('/filtering-source', 
  booksController.getFilteringSource
)

router.get('/:id', 
  couldBeAuthenticated,
  booksController.getBook)

router.patch('/:id',
  isAuthenticated,
  booksController.updateBook)

router.delete('/:id',
  isAuthenticated,
  booksController.deleteBook)

router.post('/:id/state', 
  isAuthenticated,
  booksController.changeState)

router.post('/:id/like', 
  isAuthenticated,
  booksController.toggleLike)

router.post('/:id/bookmark', 
  isAuthenticated,
  booksController.toggleBookmark)



export default router;