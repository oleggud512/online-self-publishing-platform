import * as admin from "firebase-admin"
import cors = require("cors")
import express = require("express")
import qs = require("qs")
import mongoose from "mongoose"
import config from './config'
import http from "http"
import serviceAccount = require("./serviceAccountKey.json")
import { initializeApp } from "firebase/app";
import f from "./firebase-constants";
import rootRouter from "./router"
import { handleErrorMiddleware } from "./src/common/handle-error"
import { setupSocketIoServer } from "./socket"
import { scheduleTasks } from "./scheduler"
import { BookView } from "./src/features/linking/View"
import { Book } from "./src/features/books/Book"
import { syncScore } from "./src/features/books/service"
import { Chapter } from "./src/features/chapters/Chapter"

admin.initializeApp({
  credential: admin.credential.cert(<admin.ServiceAccount>serviceAccount)
})

const app = initializeApp(f.firebaseConfig);

mongoose.set('strictQuery', true)
mongoose.set('strictPopulate', false)
mongoose.connect(config.MONGO_URI).then(async (v) => {
  console.log("connected to mongodb+srv://<user>:<password>@firstcluster.t0xvhqq.mongodb.net/books")
  const app = express()

  scheduleTasks()
  // syncScore()

  app.use(cors())
  app.use(express.json())
  app.use(express.urlencoded({extended: true }))
  
  app.use("/api/v1", rootRouter)
  app.use(handleErrorMiddleware)

  const server = http.createServer(app)
  
  setupSocketIoServer(server)
  
  const PORT = process.env.PORT || 3000

  server.listen(PORT, () => {
    console.log(`Books server is running on port ${PORT}`)
  })
})
