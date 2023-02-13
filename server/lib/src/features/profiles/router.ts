import express = require("express")
import { couldBeAuthenticated, isAuthenticated } from "../auth/authenticated"
import { isAuthorized } from "../auth/authorized"
import * as profileController from "./controller"

const router = express.Router()

router.get("/", 
  couldBeAuthenticated, 
  profileController.getProfiles)
router.get("/is-unique-name", profileController.isUniqueName) 

router.post('/subscribe/:id', isAuthenticated, profileController.subscribe)
router.post('/unsubscribe/:id', isAuthenticated, profileController.unsubscribe)
router.post('/isSubscribed/:id', isAuthenticated, profileController.isSubscribed)

router.get("/:id", profileController.getProfile)

router.get('/:id/subscribers', profileController.subscribers)
router.get('/:id/subscriptions', profileController.subscriptions)

router.post("/:id", 
  isAuthenticated,
  profileController.updateProfile)

export default router