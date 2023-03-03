import express = require("express")

import usersRouter from "./src/features/users/router"
import authRouter from "./src/features/auth/router"
import profilesRouter from "./src/features/profiles/router"
import booksRouter from "./src/features/books/router"
import commentsRouter from "./src/features/comments/router"
import chatsRouter from "./src/features/messages/router"
import chaptersRouter from "./src/features/chapters/router"
import reportsRouter from "./src/features/reports/router"

const rootRouter = express.Router()

rootRouter.use("/users", usersRouter)
rootRouter.use("/auth", authRouter)
rootRouter.use("/profiles", profilesRouter)
rootRouter.use("/books", booksRouter)
rootRouter.use("/comments", commentsRouter)
rootRouter.use("/chats", chatsRouter)
rootRouter.use("/chapters", chaptersRouter)
rootRouter.use("/reports", reportsRouter)

export default rootRouter