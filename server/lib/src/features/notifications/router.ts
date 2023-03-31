import express = require("express")
import { isAuthenticated } from "../auth/authenticated"
import * as notificationController from "./controller"

const router = express.Router()

router.post('/fcm', isAuthenticated, notificationController.syncToken)

export default router