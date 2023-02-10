import express = require("express")
import usersRouter from "../../features/users/usersRouter"
import authRouter from "../../features/auth/router"
import profilesRouter from "../../features/profiles/router"

const rootRouter = express.Router()

rootRouter.use("/users", usersRouter)
rootRouter.use("/auth", authRouter)
rootRouter.use("/profiles", profilesRouter)

export default rootRouter