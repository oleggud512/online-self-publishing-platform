
import { Aggregate } from "mongoose";
import { Subscriptions } from "../linking/Subscriptions";
import { SubscriptionsAggregationBuilder } from "../linking/subscriptionsQuery";
import { Gender, IProfile, Profile } from "./Profile";
import { ProfilesAggregation } from "./query";


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
  limit: number, 
  from: number, 
  exclude?: string
) : Promise<Array<IProfile>> {
  var aggr = new ProfilesAggregation()
  aggr.profiles(query, from, limit)
  if (exclude) aggr.exclude(exclude)
  aggr.withIsSubscribed(exclude)
  return await Profile.aggregate(aggr.build())
}

export async function getProfile(id: string) : Promise<IProfile> {
  let data = await Profile.aggregate(
    new ProfilesAggregation()
      .profile(id)
      .withBooks()
      .build()
  )
  return data[0] as IProfile
}

export async function isUniqueName(name: string, uid?: string) : Promise<boolean> {
  const profiles = await Profile.find({ name: name, _id: { $ne: uid } }, "name")
  console.log({name, uid, profiles})
  return profiles.length == 0
}

export async function updateProfile(profile: IProfile) : Promise<IProfile> {
  const up = await Profile.findByIdAndUpdate(profile._id, profile)
  console.log(up)
  return getProfile(profile._id)
}


export async function subscribe(profile: string, subscribedTo: string) : Promise<boolean> {
  console.log({ profile, subscribedTo })
  const profiles = await Profile.find({ 
    _id: { $in: [ profile, subscribedTo ] }
  }, "_id")
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
  return true
}

export async function unsubscribe(profile: string, subscribedTo: string) : Promise<boolean> {
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

export async function subscribers(
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

export async function subscriptions(
  _id: string, 
  from: number = 0, 
  pageSize: number = 20
) : Promise<IProfile[]>{
  return await new SubscriptionsAggregationBuilder()
    .subscriptions(_id)
    .sort({ name: 1 })
    .page(from, pageSize)
    .build()
}