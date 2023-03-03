import { Chat, IMessage, Message } from "./Message"
import { MessageAggregationBuilder } from "./message-aggregation-builder"
import * as socket from './socket'

export async function getChats(
  forProfile: string, 
  from: number, 
  pageSize: number
) : Promise<Chat[]> {
  const chats = await new MessageAggregationBuilder(forProfile)
    .chats()
    .page(from, pageSize)
    .build()
  return chats
}

export async function getMessages(
  forProfile: string, 
  other: string, 
  from: number, 
  pageSize: number
) : Promise<IMessage[]> {
  const messages = await new MessageAggregationBuilder(forProfile)
    .messages(other)
    .page(from, pageSize)
    .build()
  return messages
}

export async function addMessage(
  from: string, 
  to: string, 
  content: string
) : Promise<IMessage> {
  const message = await new Message({from, to, content}).save()
  await message.populate('from', '_id name displayName avatarUrl')
  console.log("add message")
  console.log(message)
  socket.addMessage(message)
  return message
}