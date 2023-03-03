import express = require("express")
import { couldBeAuthenticated, isAuthenticated } from "../auth/authenticated"
import * as chaptersController from "./controller"

const router = express.Router()

router.get('/', couldBeAuthenticated, chaptersController.getChapters)
router.post('/', isAuthenticated, chaptersController.addChapter)
router.get('/:id', couldBeAuthenticated, chaptersController.getChapter)
router.put('/:id', isAuthenticated, chaptersController.updateChapter)
router.delete('/:id', isAuthenticated, chaptersController.deleteChapter)
router.post('/:id/state', isAuthenticated, chaptersController.toggleState)

export default router