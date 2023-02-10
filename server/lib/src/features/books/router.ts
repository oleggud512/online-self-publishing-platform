import express from 'express';
import { getAllBooks, createBook, getBookById, updateBook } from './controller';

const router = express.Router();

router.get('/', getAllBooks);
router.post('/', createBook);
router.get('/:id', getBookById);
router.patch('/:id', updateBook);

export default router;