import { Types } from "mongoose"
import { Action, ActionType } from "./Action"
import { Report, ReportState } from "./Report"
import * as reportService from "./service"


export async function addMessage(args: {
  authorId: string 
  reportId: string
  content: string 
}) {
  const { authorId, reportId, content } = args
  const act = await new Action({
    actionType: ActionType.message,
    author: authorId,
    report: reportId,
    content: content
  }).save()
  return act
}




export async function addProfileUpdated(args: {
  actionType: string
  authorId: string // обновлять профиль может только сам автор action'а (и админ тоже может.)
  profileId: string
}) {
  const reports = await Report.find({ 
    state: ReportState.inProgress, 
    defendant: args.profileId // потому что эти actions могут быть отправлены не только в Profile reports но и в book. Поэтому я не использую просто subject: args.profileId
  })
  var actions = []
  for (var rep of reports) {
    actions.push(new Action({
      actionType: args.actionType,
      author: args.authorId,
      profile: args.profileId,
      report: rep._id,
    }))
    console.log(actions)
  }
  await Action.insertMany(actions)
}


export async function addCommentDeleted(args: {
  commentId: string
  authorId: string // обновлять профиль может только сам автор action'а
}) {
  const reports = await Report.find({ 
    state: ReportState.inProgress, 
    subject: new Types.ObjectId(args.commentId),
  })
  var actions = []
  for (var rep of reports) {
    actions.push(new Action({
      actionType: ActionType.deleteComment,
      author: args.authorId,
      content: ActionType.deleteComment,
      report: rep._id,
    }))
    reportService.closeReport(rep._id)
    console.log(actions)
  }
  await Action.insertMany(actions)
}


export async function addBookUpdated(args: {
  actionType: string
  authorId: string // полюбому будет автором книги bookId. 
  bookId: string,
  chapterId?: string
}) {
  const { actionType, authorId, bookId, chapterId } = args
  console.log({ authorId, bookId, chapterId })
  const reports = await Report.find({ 
    $and: [
      {
        $or: [ 
          { subject: authorId }, 
          { subject: new Types.ObjectId(bookId) } 
        ]
      },
      { state: ReportState.inProgress }
    ]
  })
  console.log({ mes: "reports to add action to", reports})
  const actions = []
  for (var rep of reports) {
    actions.push(new Action({
      actionType: actionType,
      author: authorId,
      report: rep._id,
      book: bookId,
      chapter: chapterId
    }))
  }
  await Action.insertMany(actions)
}

