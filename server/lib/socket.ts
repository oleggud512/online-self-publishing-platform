import http from "http"
import { Server, Socket } from "socket.io"
import { AuthResult, isAuthenticatedSocket } from "./src/features/auth/authenticated"
import { setupChatsSocket } from "./src/features/messages/socket"

export function setupSocketIoServer(httpServer: http.Server) {
  var io = new Server(httpServer, {
    cors: {
      origin: "http://localhost:8080",
      credentials: true
    }
  })

  
  io.on("connection", (socket) => {
    console.log("user connected to the global namespance.")
    socket.on("disconnect", () => {
      console.log("user disconnected from the clobal namespance.")
    })
  })
  
  setupChatsSocket(io)
}