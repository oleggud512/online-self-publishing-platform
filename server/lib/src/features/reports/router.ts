import express = require("express")
import { isAuthenticated } from "../auth/authenticated"
import * as reportsController from "./controller"

const router = express.Router()

router.post('/', isAuthenticated, reportsController.addReport)
router.get('/types', reportsController.getTypes)


export default router