import express = require("express")
import { isAuthenticated } from "../auth/authenticated"
import { isAuthorizedAdmin } from "../auth/authorized"
import * as reportsController from "./controller"

const router = express.Router()

router.get('/', isAuthenticated, isAuthorizedAdmin(), reportsController.getReports)

router.post('/', isAuthenticated, reportsController.addReport)
router.get('/types', reportsController.getTypes)

router.get('/chats', isAuthenticated, reportsController.getChats)

router.get('/:id', isAuthenticated, isAuthorizedAdmin(), reportsController.getReport)
router.patch('/:id/take', isAuthenticated, isAuthorizedAdmin(), reportsController.takeReport)
router.patch('/:id/close', isAuthenticated, isAuthorizedAdmin(), reportsController.closeReport)
router.patch('/:id/open', isAuthenticated, isAuthorizedAdmin(), reportsController.openReport)
router.patch('/:id/reject', isAuthenticated, isAuthorizedAdmin(), reportsController.rejectReport)

router.get('/:id/messages', isAuthenticated, reportsController.getMessages)
router.post('/:id/messages', isAuthenticated, reportsController.addMessageAction)

export default router
