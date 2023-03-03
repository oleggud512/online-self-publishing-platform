import mongoose, { Types } from "mongoose";
import { AppError } from "../../common/app-error";
import { Likes } from "../linking/Likes";
import { Comment, IComment } from "./Comment";
import { CommentsAggregationBuilder } from "./comments-aggregation-builder";
import { Sorting } from "./Sorting";
import "../../common/date-ext"
import { AppErrors } from "../../shared/errors";

export async function getComments(
  args: {
    subjectId?: string,
    questionId?: string,
    sorting?: Sorting,
    from: number,
    pageSize: number,
    forProfile?: string
  }
) {
  const { subjectId, questionId, sorting, from, pageSize, forProfile } = args
  console.log({ subjectId, questionId, sorting, from, pageSize })
  var builder = new CommentsAggregationBuilder()

  if (questionId) {
    builder.answers(questionId, forProfile)
    // return the list of top level comments WITH pagination WITH may be 'popular'
    // won't go further
  } else if (subjectId) {
    // return the list of answers for question WITHOUT pagination 'new'
    builder
      .comments(subjectId, sorting ?? 'new', forProfile)
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
    questionId?: string
  }
) : Promise<IComment> { 
  try {
    const questionComment = await Comment.findOne({ _id: args.questionId });
    const newComment = await new Comment({ 
      content: args.content, 
      question: args.questionId, 
      subject: args.subjectId,
      author: args.ofProfile,
      depth: (questionComment?.depth ?? -1) + 1
    }).save()
    return getComment(newComment._id)
  } catch (e) {
    console.error(e)
    throw e
  }
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

  await Comment.findByIdAndDelete(commentId)
  
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
        onModel: 'Comment'
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
    console.log('comment!.rate == 0')
    return false
  }
  if (comment!.createdAt!.getDate() < new Date().subtractDays(1).getDate()) { 
    console.log('comment!.createdAt!.getDate() > new Date().subtractDays(1).getDate()')
    return false
  }
  if (comment!.author._id != forProfile) {
    console.log('comment!.author._id != forProfile')
    return false
  }
  if (comment!.hasAnswers) {
    console.log('comment!.hasAnswers')
    return false
  }
  // if (!comment ||
  //   comment!.rate == 0 || 
  //   comment!.createdAt!.getDate() > new Date().subtractDays(1).getDate() || 
  //   comment!.author._id != forProfile ||
  //   comment!.hasAnswers
  // ) {
  //   return false
  // }
  return true
}