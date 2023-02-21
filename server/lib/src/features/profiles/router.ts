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

router.get("/:id", 
  couldBeAuthenticated,
  profileController.getProfile)

router.put("/:id", 
  isAuthenticated,
  profileController.updateProfile)

router.get('/:id/subscribers', profileController.getSubscribers)
router.get('/:id/subscriptions', profileController.getSubscriptions)

// see books router for books/:id/bookmark to toggle bookmark for the user. 
router.post('/:id/bookmarks', isAuthenticated, profileController.addBookmarks)
router.get('/:id/bookmarks', isAuthenticated, profileController.getBookmarks)


export default router