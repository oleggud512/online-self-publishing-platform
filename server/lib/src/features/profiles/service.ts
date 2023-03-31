import { Aggregate } from "mongoose";
import { IBook } from "../books/Book";
import { BookAggregationBuilder } from "../books/book-aggregation-builder";
import { Bookmarks } from "../linking/Bookmarks";
import { Subscriptions } from "../linking/Subscriptions";
import { 
  SubscriptionsAggregationBuilder 
} from "../linking/subscriptions-aggregation-builder";
import { Gender, IProfile, Profile } from "./Profile";
import { ProfileAggregationBuilder as ProfileAggregationBuilder } from "./profile-aggregation-builder";
import { somethingWithAuthor } from "./profile-aggreation-utils";
import { 
  BookmarksAggregationBuilder 
} from "../linking/bookmarks-aggregation-builder";
import * as actionService from "../reports/action-service"
import { AppError } from "../../common/app-error";
import { ActionType } from "../reports/Action";
import { Restriction } from "../restrictions/Restriction";
import { ProfilePermissions } from "./ProfilePermissions";
import * as restrictionService from "../restrictions/service"
import * as notificationService from "../notifications/service"


export async function createProfile(
  newProfile: {
    _id: string,
    email: string,
    name: string,
    displayName: string,
    age: number,
    gender: Gender
  }
) : Promise<IProfile> {
  const createdProfile = await new Profile(newProfile).save()
  return createdProfile.toObject()
}

export async function getProfiles(
  query: string, 
  from: number, 
  pageSize: number, 
  exclude?: string
) : Promise<Array<IProfile>> {
  var aggr = new ProfileAggregationBuilder()
    .profiles(query) 
  if (exclude) aggr.exclude(exclude)
  aggr
    .page(from, pageSize)
    .withIsSubscribed(exclude)
  return await aggr.build()
}

export async function getProfile(
  id: string, 
  forProfile?: string
) : Promise<IProfile> {
  let data = await new ProfileAggregationBuilder()
    .profile(id)
    .withBooks(id, forProfile)
    .build()
  return data[0] as IProfile
}

export async function getProfileForAdmin(id: string, forProfile: string) : Promise<IProfile> {
  let data = await new ProfileAggregationBuilder()
    .profile(id)
    .withBooks(id, forProfile)
    .withReports()
    .build()
  return data[0]
}

export async function isUniqueName(
  name: string, 
  uid?: string
) : Promise<boolean> {
  const profiles = await Profile.find({ name: name, _id: { $ne: uid } }, "name")
  console.log({name, uid, profiles})
  return profiles.length == 0
}

export async function updateProfile(profile: IProfile) : Promise<IProfile> {
  const up = await Profile.updateOne({ _id: profile._id }, profile)
  console.log(up)
  if (up.acknowledged && up.modifiedCount > 0) {
    console.log('up.acknowledged!!!!')
    actionService.addProfileUpdated({
      actionType: ActionType.updateProfile,
      authorId: profile._id,
      profileId: profile._id
    })
  }
  return getProfile(profile._id)
}

export async function subscribe(
  profile: string, 
  subscribedTo: string
) : Promise<boolean> {
  console.log({ profile, subscribedTo })
  const profiles = await Profile.find({ 
    _id: { $in: [ profile, subscribedTo ] }
  })
  // console.log(`length = ${await Profile.aggregate(new ProfilesAggregation().profile(profile).profile(subscribedTo).build())}`)
  if (profiles.length < 2) return false

  await new Subscriptions({profile: profile, subscribedTo: subscribedTo}).save()

  await Profile.bulkWrite([
    {
      updateOne: {
        filter: { _id: profile },
        update: { $inc: { subscriptions: 1 } }
      },
    },
    {
      updateOne: {
        filter: { _id: subscribedTo },
        update: { $inc: { subscribers: 1 } }
      },
    },
  ])

  notificationService.sendSubscribedNotification(
    profiles.find(p => p._id == profile)!, 
    subscribedTo
  )
  return true
}

export async function unsubscribe(
  profile: string, 
  subscribedTo: string
) : Promise<boolean> {
  const profiles = await Profile.find({
    _id: { $in: [ profile, subscribedTo ] }
  })
  if (profiles.length < 2) return false
  
  await Subscriptions.findOneAndRemove({ profile, subscribedTo })

  await Profile.bulkWrite([
    {
      updateOne: {
        filter: { _id: profile },
        update: { $inc: { subscriptions: -1 } }
      },
    },
    {
      updateOne: {
        filter: { _id: subscribedTo },
        update: { $inc: { subscribers: -1 } }
      },
    },
  ])
  return true;
}

export async function isSubscribed(profile: string, subscribedTo: string) 
    : Promise<boolean> {
  const subscription = await Subscriptions.findOne({ profile, subscribedTo })
  if (subscription) return true;
  return false;
}

export async function getSubscribers(
  _id: string, 
  from: number = 0, 
  pageSize: number = 20
) : Promise<IProfile[]>{
  return await new SubscriptionsAggregationBuilder()
    .subscribers(_id)
    .sort({ name: 1 })
    .page(from, pageSize)
    .build()
}

export async function getSubscriptions(
  _id: string, 
  from: number = 0, 
  pageSize: number = 20
) : Promise<IProfile[]> {
  return await new SubscriptionsAggregationBuilder()
    .subscriptions(_id)
    .sort({ name: 1 })
    .page(from, pageSize)
    .build()
}

export async function addBookmarks(
  forProfile: string,
  newBookmarks: string[]
) : Promise<boolean> {
  const bookmarks = await Bookmarks.find({ profile: forProfile })
  var bookmarksToInsert: any[] = []
  
  for (let bookmark of newBookmarks) {
    console.log(`bookmark: ${bookmark}`)
    console.log(bookmarks.findIndex(b => b.book == bookmark))
    if (bookmarks.findIndex(b => b.book == bookmark) == -1) {
      bookmarksToInsert.push({ book: bookmark, profile: forProfile })
    }
  }
  await Bookmarks.insertMany(bookmarksToInsert)

  return true
}


export async function getBookmarks(
  profileId: string, 
  from: number = 0, 
  pageSize: number = 20
) : Promise<IBook[]> {
  const books = await new BookmarksAggregationBuilder()
    .bookmarks(profileId)
    .page(from, pageSize)
    .build()
  return books
}


export async function getPermissions(profileId: string) {
  const restrictions = await restrictionService.getRestrictions(profileId)

  const publishBookRestriction = restrictions.find(
    r => r.restriction == Restriction.Name.publishBook
  )
  const addCommentRestriction = restrictions.find(
    r => r.restriction == Restriction.Name.addComment
  )

  return new ProfilePermissions({
    publishBook: !publishBookRestriction,
    addComment: !addCommentRestriction
  });
}


export async function togglePublishBook(
  profileId: string,
  adminId: string, 
  before?: Date
) {
  const canPublishBook = await restrictionService.toggleRestriction({
    subject: profileId,
    subjectName: Restriction.Subject.profile,
    restriction: Restriction.Name.publishBook,
    before
  })

  actionService.addProfileUpdated({
    actionType: canPublishBook 
      ? ActionType.allowPublishBook
      : ActionType.restrictPublishBook,
    authorId: adminId,
    profileId: profileId
  })

  return canPublishBook
}


export async function toggleAddComment(profileId: string, adminId: string, before?: Date) {
  const canAddComment = await restrictionService.toggleRestriction({
    subject: profileId,
    subjectName: Restriction.Subject.profile,
    restriction: Restriction.Name.addComment,
    before
  })

  actionService.addProfileUpdated({
    actionType: canAddComment 
      ? ActionType.allowPublishBook
      : ActionType.restrictPublishBook,
    authorId: adminId,
    profileId: profileId
  })

  return canAddComment
}