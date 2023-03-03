import * as admin from "firebase-admin"
import cors = require("cors")
import express = require("express")
import qs = require("qs")
import mongoose from "mongoose"
import config from './config'
import http from "http"
import serviceAccount = require("./serviceAccountKey.json")

// // Import the functions you need from the SDKs you need
// import { initializeApp } from "firebase/app"
// import { getAnalytics } from "firebase/analytics"
// import constants from "./src/common/constants"

// // Initialize Firebase
// const app = initializeApp(constants.firebaseConfig);
// const analytics = getAnalytics(app);

// import { getAuth } from "firebase/auth"

import rootRouter from "./router"
import { handleErrorMiddleware } from "./src/common/handle-error"
import { Comment } from "./src/features/comments/Comment"
import { Book } from "./src/features/books/Book"
import { Chapter, ReadingsState } from "./src/features/chapters/Chapter"
import { setupSocketIoServer } from "./socket"
import { Role } from "./src/features/users/models/Role"
import { ReportType } from "./src/features/reports/ReportType"

// Initialize FirebaseAdmin
admin.initializeApp({
  credential: admin.credential.cert(<admin.ServiceAccount>serviceAccount)
})

mongoose.set('strictQuery', true)
mongoose.connect(config.MONGO_URI).then(async (v) => {
  console.log("connected to mongodb+srv://<user>:<password>@firstcluster.t0xvhqq.mongodb.net/books")
  const app = express()
  
  app.use(cors())
  app.use(express.json())
  app.use(express.urlencoded({extended: true }))
  
  app.use("/api/v1", rootRouter)
  app.use(handleErrorMiddleware)

  const server = http.createServer(app)

  setupSocketIoServer(server)
  
  const PORT = process.env.PORT ?? 3000
  
  server.listen(PORT, () => {
    console.log(`Books server is running on port ${PORT}`)
  })
})