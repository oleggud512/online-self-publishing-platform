import express = require("express")
import { isAuthenticated } from "../auth/authenticated"
import * as messagesController from './controller'


const router = express.Router()

router.get('/', isAuthenticated, messagesController.getChats)
// id - other user's id.
router.get('/:id', isAuthenticated, messagesController.getMessages)
router.post('/', isAuthenticated, messagesController.addMessage)

export default router