import * as admin from "firebase-admin"
import cors = require("cors")
import express = require("express")
import qs = require("qs")
import mongoose from "mongoose"
import config from './config'
import http from "http"
import serviceAccount = require("./serviceAccountKey.json")

admin.initializeApp({
  credential: admin.credential.cert(<admin.ServiceAccount>serviceAccount)
})

import { initializeApp } from "firebase/app";

const firebaseConfig = {
  apiKey: "AIzaSyBQx-7ZGkxi08pNR4exenZEcn-zjBCtUco",
  authDomain: "books-course-work-1.firebaseapp.com",
  projectId: "books-course-work-1",
  storageBucket: "books-course-work-1.appspot.com",
  messagingSenderId: "626801727731",
  appId: "1:626801727731:web:93cee90387c04319f03f86",
  measurementId: "G-M23LPKWEPG"
};

function sendMessage() {
  const m = admin.messaging()
  m.sendToDevice("dnSLbeuuTgu-mJMBOis5l4:APA91bFhMjfGdNcSP5DDbOO8-lZX9iDpm030jynaaeNetB6vTZUJGWR5A23uREddL0OSSj_CFFicNzMO-17LUJpu9wIwEyn4qrH__Lkp56edth7Lv-lYwycLd-U1FZUExBicFyk3HL25", { 
    // notification: { 
    //   title: "Hello from index.ts", 
    //   body: "I sent you (/client) a message from my /server."
    // },
    data: {
      notificationType: NotificationType.newChapter,
      someData1: "data value",
      otherUsefulDataFromOLEG: 'some other useful value',
      andelse: "goon"
    }
  })
}

const app = initializeApp(firebaseConfig);
// const analytics = getAnalytics(app);

import rootRouter from "./router"
import { handleErrorMiddleware } from "./src/common/handle-error"
import { setupSocketIoServer } from "./socket"
import { scheduleTasks } from "./scheduler"
import { NotificationType } from "./src/features/notifications/notification"


mongoose.set('strictQuery', true)
mongoose.set('strictPopulate', false)
mongoose.connect(config.MONGO_URI).then(async (v) => {
  console.log("connected to mongodb+srv://<user>:<password>@firstcluster.t0xvhqq.mongodb.net/books")
  const app = express()

  scheduleTasks()

  // sendMessage()
  
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