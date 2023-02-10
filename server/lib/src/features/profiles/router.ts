import express = require("express")
import { isAuthenticated } from "../auth/authenticated"
import { isAuthorized } from "../auth/authorized"
import * as profileController from "./controller"

const router = express.Router()

router.get("/", profileController.getProfiles)
router.get("/is-unique-name", profileController.isUniqueName) 
router.get("/:id", profileController.getProfile)
router.post("/:id", 
  isAuthenticated,
  profileController.updateProfile)

export default router