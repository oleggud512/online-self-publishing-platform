import express = require("express")

import * as authController from "./controller"

const router = express.Router()

router.post('/google', authController.signUpWithGoogle)
router.post('/password', authController.signUpWithEmailAndPassword)

export default router