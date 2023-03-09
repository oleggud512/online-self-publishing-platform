import { Types } from "mongoose"
import { Action, ActionType } from "./Action"
import { Report } from "./Report"

export async function addMessage(args: {
  authorId: string 
  reportId: string
  content: string 
}) {
  const { authorId, reportId, content } = args
  await new Action({
    actionType: ActionType.message,
    author: authorId,
    report: reportId,
    content: content
  }).save()
}

export async function addBookUpdated(args: {
  actionType: string
  authorId: string // полюбому будет автором книги bookId. 
  bookId: string
}) {
  const { 
    actionType, 
    authorId, 
    bookId 
  } = args
  const reports = await Report.find({ 
    $or: [ 
      { subject: authorId }, 
      { subject: new Types.ObjectId(bookId) } 
    ]
  })

  const actions = []
  for (var rep of reports) {
    actions.push(new Action({
      actionType: actionType,
      author: authorId,
      report: rep._id,
      book: bookId
    }))
  }
  await Action.insertMany(actions)
}

export async function addChapterUpdated(args: {
  actionType: string
  authorId: string 
  reportId: string
  chapterId: string
  bookId: string
}) {
  const { actionType, authorId, reportId, bookId, chapterId } = args
  await new Action({
    actionType: actionType,
    author: authorId,
    report: reportId,
    book: bookId,
    chapter: chapterId
  })
}