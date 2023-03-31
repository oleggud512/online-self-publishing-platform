import express = require("express")
import * as usersController from "./controller"
import { isAuthenticated } from "../auth/authenticated"
import { isAuthorized, isAuthorizedAdmin } from "../auth/authorized"

const router = express.Router()

router.post("/", 
  isAuthenticated,
  isAuthorized({hasRole: ['admin', 'super-admin']}),
  usersController.createUser
)

router.get("/", 
  isAuthenticated, 
  isAuthorized({hasRole: ['admin', 'super-admin'], allowSameUser: true}),
  usersController.getUsers
)

router.get("/isAdmin", // на одной и той же глубине сначала нужно определять fixed рауты, а потом уже fluid.
  usersController.isAdmin 
)

router.get("/:uid", 
  isAuthenticated, 
  isAuthorized({hasRole: ['admin', 'super-admin'], allowSameUser: true}),
  usersController.getUser
)

router.patch("/:uid", 
  isAuthenticated, 
  isAuthorized({hasRole: ['admin', 'super-admin'], allowSameUser: true}),
  usersController.updateUser
)

router.delete("/:uid", 
  isAuthenticated, 
  isAuthorized({hasRole: ['admin', 'super-admin'], allowSameUser: true}),
  usersController.deleteUser)

router.put("/:uid/blocked", 
  isAuthenticated,
  isAuthorizedAdmin(),
  usersController.toggleBlocked)

router.get("/:uid/blocked",
  isAuthenticated,
  isAuthorizedAdmin(),
  usersController.isBlocked)

export default router