import * as admin from "firebase-admin"
import cors = require("cors")
import express = require("express")
import serviceAccount = require("./serviceAccountKey.json")
import mongoose from "mongoose"

// // Import the functions you need from the SDKs you need
// import { initializeApp } from "firebase/app"
// import { getAnalytics } from "firebase/analytics"
// import constants from "./src/common/constants"

// // Initialize Firebase
// const app = initializeApp(constants.firebaseConfig);
// const analytics = getAnalytics(app);

// import { getAuth } from "firebase/auth"

import rootRouter from "./src/v1/routes"
import { handleErrorMiddleware } from "./src/common/handleError"

// Initialize FirebaseAdmin
admin.initializeApp({
  credential: admin.credential.cert(<admin.ServiceAccount>serviceAccount)
})

mongoose.set('strictQuery', true)
mongoose.connect("mongodb://127.0.0.1:27017/books").then(async (v) => {
  console.log("connected to mongodb://localhost:27017/books")
  const app = express()
  
  app.use(cors())
  app.use(express.json())
  app.use(express.urlencoded({extended: true}))
  
  app.use("/api/v1", rootRouter)
  // app.use(handleErrorMiddleware)
  
  const PORT = process.env.PORT ?? 3000
  
  app.listen(PORT, () => {
    console.log(`Books server is running on port ${PORT}`)
  })
})