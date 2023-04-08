import mongoose, { Types } from "mongoose";
import { AppError } from "../../common/app-error";
import { Likes } from "../linking/Likes";
import { Comment, IComment } from "./Comment";
import { CommentsAggregationBuilder } from "./comments-aggregation-builder";
import { Sorting } from "./Sorting";
import "../../common/ext-date"
import { AppErrors } from "../../shared/errors";
import { IProfile, Profile } from "../profiles/Profile";
import * as actionService from "../reports/action-service"
import * as notificationService from "../notifications/service"
import * as restrictionService from "../restrictions/service"
import { Restriction } from "../restrictions/Restriction";
import { CommentSubjects } from "./CommentSubjects";
import { Book, IBook } from "../books/Book";
import { IChapter } from "../chapters/Chapter";

export async function getComments(
  args: {
    subjectId?: string
    questionId?: string
    full: boolean
    sorting?: Sorting
    from: number
    pageSize: number
    forProfile?: string
  }
) {
  const { subjectId, questionId, sorting, full, from, pageSize, forProfile } = args
  console.log({ subjectId, questionId, sorting, full, from, pageSize })
  var builder = new CommentsAggregationBuilder()

  if (questionId) {
    builder.answers(questionId, forProfile, full)
    // return the list of top level comments WITH pagination WITH may be 'popular'
    // won't go further
  } else if (subjectId) {
    // return the list of answers for question WITHOUT pagination 'new'
    builder
      .comments(subjectId, sorting ?? 'new', forProfile, full)
      .page(from, pageSize)
  }
  const comments = await builder.build()
  console.log(comments)
  return comments
}

export async function addComment(
  args: {
    ofProfile: string
    content: string
    subjectId: string
    subjectName: string
    questionId?: string
  }
) : Promise<IComment> { 
  try {
    const author = await Profile.findById(args.ofProfile)

    const restrictions = 
      await restrictionService.getRestrictions(args.ofProfile)
    const addCommentRestriction = 
      restrictions.find(r => r.restriction == Restriction.Name.addComment)
    if (!author || addCommentRestriction) {
      console.log({ cannotChangeState: author })
      throw new AppError(AppErrors.cannotAddComment)
    }
    
    const questionComment = await Comment.findOne({ _id: args.questionId ?? args.subjectId });
    const newComment = await new Comment({ 
      content: args.content, 
      question: args.questionId, 
      subject: args.subjectId,
      subjectName: args.subjectName,
      author: args.ofProfile,
      depth: (questionComment?.depth ?? -1) + 1
    }).save()
    
    if (![CommentSubjects.book, CommentSubjects.chapter]
        .includes(newComment.subjectName)) {
          throw 'check if it\'s a chapter or do something else...'
        }
    // increment the count of comments 
    const book = await getCommentBook(newComment._id)
    if (book) Book.updateOne(
      { _id: book._id }, 
      { $inc: { commentCount: 1 } }
    ).exec()
    
    // send notification to the owner of the book 
    const commentReceiver = (await new CommentsAggregationBuilder()
      .commentReceiver(newComment!._id)
      .build())[0]
      
    console.log({commentReceiver})
    
    if (questionComment) { 
      notificationService.sendCommentAnswerNotification(
        newComment, 
        commentReceiver
      )
    }
    return getComment(newComment._id)
  } catch (e) {
    console.error(e)
    throw e
  }
}


async function getCommentBook(commentId: string) : Promise<IBook | undefined> {
  const comment = (await new CommentsAggregationBuilder()
    .comment(commentId, undefined, true).build())[0] as IComment
  if (![CommentSubjects.book, CommentSubjects.chapter]
      .includes(comment.subjectName)) {
        return
      }
  const book = comment.subjectName == CommentSubjects.book
    ? comment.subject as IBook
    : (comment.subject as IChapter).book as IBook

  return book
}


async function getComment(id: string, forProfile?: string) : Promise<IComment> {
  return (await new CommentsAggregationBuilder().comment(id, forProfile).build())[0];
}


export async function updateComment(
  comment: {
    id: string,
    content: string
  },
  forProfile: string
) : Promise<IComment> {
  console.log(comment.id)
  const commentToUpdate = await getComment(comment.id, forProfile)
  console.log(commentToUpdate)
  if (!canEditComment(commentToUpdate, forProfile)) {
    throw new AppError(AppErrors.cannotEditComment)
  }
  
  await Comment.findByIdAndUpdate(comment.id, { content: comment.content })
  return await getComment(comment.id, forProfile)
}


export async function deleteComment(commentId: string, profileId: string) {
  const commentToDelete = await getComment(commentId, profileId)

  if (!canEditComment(commentToDelete, profileId)) {
    return false
  }

  // decrement comment count
  const book = await getCommentBook(commentId)
  if (book) Book.updateOne(
    { _id: book._id }, 
    { $inc: { commentCount: -1 } }
  ).exec()

  await Comment.findByIdAndDelete(commentId)

  console.log({commentToDelete: commentId})
  
  return true
}


export async function rateComment(
  commentId: string, 
  profileId: string, 
  myNewRate: number
) : Promise<number> {
  const existedRate = await Likes.findOne({ subject: commentId, profile: profileId })

  const myPrevRate = existedRate?.rate ?? 0

  var rateChange: number = 0

  console.log('before')
  console.log({myPrevRate, myNewRate, rateChange})

  if (myPrevRate == myNewRate) { // в теории, это должно вызываться только когда снимается лайк/дизлайк
    await Likes.deleteOne({ subject: commentId, profile: profileId })
    rateChange = myNewRate * -1
    console.log('after myPrevRate == myNewRate')
    console.log({myPrevRate, myNewRate, rateChange})
  } else {
    if (existedRate) {
      await Likes.findByIdAndUpdate(existedRate._id, { rate: myNewRate })
    } else {
      await new Likes({
        subject: commentId,
        profile: profileId,
        rate: myNewRate,
        subjectName: 'Comment'
      }).save()
    }
    // prev =  0  new =  1   =>   change =  1
    // prev =  0  new = -1   =>   change = -1
    // prev = -1  new =  1   =>   change =  2
    // prev =  1  new = -1   =>   change = -2
    rateChange = myPrevRate == 0 
      ? myNewRate 
      : myNewRate == 1 
          ? 2 
          : -2
    console.log('after else')
    console.log({myPrevRate, myNewRate, rateChange})
  }
  console.log(typeof rateChange)
  console.log(rateChange)
  const updatedComment = await Comment.findByIdAndUpdate(
    commentId, 
    { $inc: { rate: rateChange } }, 
    { new: true }
  )
  return updatedComment!.rate
}


export async function deleteCommentsForSubject(subjectId: string) {
  const comments = await Comment.find(
    { subject: new Types.ObjectId(subjectId) }, 
    { _id: 1 }
  )
  const ids = comments.map((c) => c._id)
  await Likes.deleteMany({ subject: { $in: ids } })
  await Comment.deleteMany({ _id: { $in: ids } })
}

function canEditComment(comment: IComment | undefined, forProfile: string) : boolean {
  if (!comment) { 
    console.log('no comment')
    return false
  }
  if (comment!.rate != 0) { 
    console.log(comment)
    console.log('comment has been rated. Can\'t edit.')
    return false
  }
  if (comment!.createdAt!.getDate() < new Date().subtractDays(1).getDate()) { 
    console.log('24hours passed. You can\'t edit the comment.')
    return false
  }
  if ((comment!.author as IProfile)._id != forProfile) {
    console.log('Who are you? It\'s not your comment. Can\'t edit')
    return false
  }
  if (comment!.hasAnswers) {
    console.log('The comment has answers. Can\'t edit')
    return false
  }
  return true
}


export async function deleteCommentAdmin(
  commentId: string, 
  profileId: string
): Promise<boolean> {
  var deletedCount: number = 0
  async function del(commentId: string) : Promise<boolean> {
    try {
      var res = true
  
      const comment = await Comment.findById(commentId);
    
      if (!comment) {
        throw new Error('Comment not found');
      }
    
      const answers = await Comment.find({ question: commentId });
      for (const answer of answers) {
        res &&= await del(answer._id);
      }
      
      await Likes.deleteMany({ subject: { $in: answers.map(c => c._id) } })
      await comment.remove();
      deletedCount++
      return res
    } catch (e) {
      return false
    }
  }
  const book = await getCommentBook(commentId)

  const res = await del(commentId)
  actionService.addCommentDeleted({ commentId, authorId: profileId})

  // sync commentCount
  if (book) Book.updateOne(
    { _id: book._id }, 
    { $inc: { commentCount: -deletedCount } }
  ).exec()

  return res
}

