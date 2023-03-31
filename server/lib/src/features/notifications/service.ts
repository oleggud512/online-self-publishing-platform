import { FCMToken, IFCMToken } from "./FCMToken"
import "../../common/ext-date"
import { Chapter } from "../chapters/Chapter"
import { IBook } from "../books/Book"
import * as admin from "firebase-admin"
import { NotificationData, NotificationType } from "./notification"
import { Types } from "mongoose"
import { IReport, ReportSubject } from "../reports/Report"
import { IProfile } from "../profiles/Profile"
import { IComment } from "../comments/Comment"


async function _getToken(profileId: string) : Promise<IFCMToken | undefined> {
  const tokens = await FCMToken
    .find({ profile: profileId })
    .sort({ syncedAt: -1 })
  return tokens[0]
}


export async function syncToken(profileId: string, token: string) : Promise<boolean> {
  const equalToken = await FCMToken.findOne({ profile: profileId, token })

  if (equalToken) {
    equalToken.syncedAt = new Date()
    await equalToken.save()
  } else {
    const newToken = new FCMToken({
      profile: profileId,
      token: token
    })
    await newToken.save()
  }

  return Boolean(equalToken)
}


export async function deleteDeadFCMTokens() {
  await FCMToken.deleteMany().lt('syncedAt', new Date().subtractMonths(1))
}


export async function sendNewChapterNotification(newChapterId: string) {
  const chapter = await Chapter.findById(newChapterId).populate('book')

  const book = chapter!.book as IBook
  const bookId = book._id
  const authorId = book.author

  const tokenDocs = await FCMToken.aggregate([
    {
      $lookup: {
        from: 'bookmarks',
        localField: 'profile',
        foreignField: 'profile',
        as: 'bookmarks',
        pipeline: [
          {
            $match: {
              book: new Types.ObjectId(bookId)
            }
          }
        ]
      }
    },
    {
      $lookup: {
        from: 'subscriptions',
        localField: 'profile',
        foreignField: 'profile',
        as: 'subscriptions',
        pipeline: [
          {
            $match: {
              subscribedTo: authorId
            }
          }
        ]
      }
    },
    {
      $match: {
        $expr: {
          $or: [
            { $not: { $eq: [ "$bookmarks",     [] ] } },
            { $not: { $eq: [ "$subscriptions", [] ] } },
          ]
        }
      }
    },
    {
      $group: {
        _id: null,
        tokens: { $push: "$token" }
      }
    }
  ])
  
  if (!tokenDocs || !tokenDocs[0]) return;

  const tokens = tokenDocs[0].tokens
  console.log(tokens)

  const mes = admin.messaging()

  const not = await mes.sendToDevice(tokens, {
    // notification: {
    //   title: "Firebase Notification",
    //   body: "Notification that is sent by firebase"
    // },
    data: {
      notificationType: NotificationType.newChapter,
      book: book.name,
      bookId: String(book._id),
      chapter: chapter!.name,
      chapterId: String(chapter!._id)
    } as NotificationData
  })
  console.log({'sendNewChapterNotification': not})

}


export async function sendBookUnpublishedNotification(book: IBook) {
  const token = await _getToken(book.author)

  if (!token) return;

  const mes = admin.messaging()
  const not = await mes.sendToDevice(token.token, {
    data: {
      notificationType: NotificationType.bookUnpublished,
      book: book.name,
      bookId: book._id.toString()
    }
  })
  console.log({'sendBookUnpublishedNotification': not})
}


export async function sendReportRejectedNotification(report: IReport) {
  console.log((report.author as IProfile)._id) // check the id
  const token = await _getToken((report.author as IProfile)._id)

  if (!token) {
    console.log('there is no token. cant send reportRejected notification')
    return
  }

  const messaging = admin.messaging()
  const not = await messaging.sendToDevice(token.token, {
    data: {
      notificationType: NotificationType.reportRejected,
      subjectName: report.subjectName,
      subjectId: (report.subject as IProfile | IBook | IComment)._id.toString(),
      subject: (report.subjectName == ReportSubject.book) 
        ? (report.subject as IBook).name
        : (report.subjectName == ReportSubject.comment)
          ? (report.subject as IComment).content
          : (report.subject as IProfile).name
    }
  })
  console.log({'sendReportRejectedNotification': not})
}


export async function sendSubscribedNotification(
  profile: IProfile,
  subscribedTo: string
) {
  const token = await _getToken(subscribedTo)
  if (!token) {
    console.log("NO TOKEN")
    return
  }

  const mes = admin.messaging()

  const not = await mes.sendToDevice(token.token, {
    data: {
      notificationType: NotificationType.subscribed,
      profileId: profile._id.toString(),
      profile: profile.name
    }
  })
  console.log({'sendSubscribedNotification': not})
}


export async function sendCommentAnswerNotification(
  comment: IComment, 
  receiver: IProfile
) {
  const token = await _getToken(comment.author as string)
  if (!token) {
    console.log("there is no token")
  }
  
  const messaging = admin.messaging()

  const not = await messaging.sendToDevice(token!.token, {
    data: {
      notificationType: NotificationType.commentAnswer,
      profile: receiver.name,
      subject: comment.subject as string,
      subjectName: comment.subjectName,
      depth: comment.depth.toString()
    }
  })
  
  console.log({'sendCommentAnswerNotification': not})
}