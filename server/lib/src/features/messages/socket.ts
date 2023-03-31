import { Namespace, Server, Socket } from "socket.io";
import { isAuthenticatedSocket } from "../auth/authenticated";
import { IMessage } from "./Message";

let chats: Namespace
let chat: Namespace


const IncomingEvents = {
  subscribeAllMessages: "subscribeAllMessages",
  unsubscribeAllMessages: "unsubscribeAllMessages",
  subscribeSpecificChatMessages: "subscribeSpecificChatMessages",
  unsubscribeSpecificChatMessages: "unsubscribeSpecificChatMessages",
}

const OutgoingEvents = {
  nextMessage: "nextMessage"
}

export function setupChatsSocket(io: Server) {
  chats = io.of('/chats')

  chats.use(isAuthenticatedSocket)

  chats.on("connection", (socket: Socket) => {

    socket.on(IncomingEvents.subscribeAllMessages, (reportId) => {
      if (chats.adapter.rooms.has(socket.handshake.auth.uid) && 
          chats.adapter.rooms.get(socket.handshake.auth.uid)!.has(socket.id)) return
      socket.join(reportId ?? socket.handshake.auth.uid)
      console.log({ 
        message: "on subscribeAllMessages", 
        // socket_auth: socket.handshake.auth,
        // socket_rooms_after: socket.rooms
      })
    })

    socket.on(IncomingEvents.unsubscribeAllMessages, (reportId) => {
      socket.leave(reportId ?? socket.handshake.auth.uid)
      console.log({ 
        message: "on unsubscribeAllMessages", 
        // socket_auth: socket.handshake.auth,
        // socket_rooms_after: socket.rooms
      })
    })
  })
}

export function addMessage(message: IMessage) {
  console.log({
    messag: "emit message",
    message: message
  })
  chats.to(message.to).emit(OutgoingEvents.nextMessage, message) // когда сообщения отправляет админ то это будет админ ид. 
  if (message.to != message.from._id) 
    chats.to(message.from._id).emit(OutgoingEvents.nextMessage, message) // когда админ отправляет то это reportId. 
}

function chatRoomName(id1: string, id2: string) : string {
  let ids = [id1, id2]
  ids.sort()
  return ids.join('-')
}