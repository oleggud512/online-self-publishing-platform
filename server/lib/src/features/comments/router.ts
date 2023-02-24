import express = require("express")
import { couldBeAuthenticated, isAuthenticated } from "../auth/authenticated"
import * as commentsController from "./controller"

const router = express.Router()

router.get('/', couldBeAuthenticated, commentsController.getComments)
router.post('/', isAuthenticated, commentsController.addComment)
router.put('/:id', isAuthenticated, commentsController.updateComment)
router.delete('/:id', isAuthenticated, commentsController.deleteComment)
router.post('/:id/rate', isAuthenticated, commentsController.rateComment)

export default router