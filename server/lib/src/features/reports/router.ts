import express = require("express")
import { isAuthenticated } from "../auth/authenticated"
import { isAuthorized, isAuthorizedAdmin } from "../auth/authorized"
import * as reportsController from "./controller"

const router = express.Router()

router.get('/', isAuthenticated, isAuthorizedAdmin(), reportsController.getReports)

router.post('/', isAuthenticated, reportsController.addReport)
router.get('/types', reportsController.getTypes)

router.get('/:id', isAuthenticated, isAuthorizedAdmin(), reportsController.getReport)
router.patch('/:id/take', isAuthenticated, isAuthorizedAdmin(), reportsController.takeReport)
router.patch('/:id/close', isAuthenticated, isAuthorizedAdmin(), reportsController.closeReport)


export default router