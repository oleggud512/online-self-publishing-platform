import express = require("express")
import usersRouter from "../../features/users/usersRouter"
import authRouter from "../../features/auth/router"
import profilesRouter from "../../features/profiles/router"
import booksRouter from "../../features/books/router"

const rootRouter = express.Router()

rootRouter.use("/users", usersRouter)
rootRouter.use("/auth", authRouter)
rootRouter.use("/profiles", profilesRouter)
rootRouter.use("/books", booksRouter)

export default rootRouter