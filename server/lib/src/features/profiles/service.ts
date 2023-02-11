
import { Subscriptions } from "../linking/Subscriptions";
import { Gender, IProfile, Profile } from "./Profile";


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

export async function getProfiles(query: string, limit: number, from: number, exclude?: string) 
: Promise<Array<IProfile>> {
  var q = Profile.aggregate([
    {
      $match: {
        $expr: {
          $or: [
            {
              $regexMatch: {
                input: '$name',
                regex: RegExp(query, 'i')
              },
            },
            {
              $regexMatch: {
                input: '$displayName',
                regex: RegExp(query, 'i')
              },
            },
            {
              $regexMatch: {
                input: '$description',
                regex: RegExp(query, 'i')
              },
            },
          ]
        }
      }
    },
    {
      $sort: {
        createdAt: 1
      }
    },
    {
      $skip: from
    },
    {
      $limit: limit,
    },
    {
      $lookup: {
        from: 'subscriptions', 
        let: {
          profileId: '$_id',
        }, 
        pipeline: [
          {
            $match: {
              $expr: {
                $and: [
                  { $eq: [ '$subscribedTo', '$$profileId' ] }, 
                  { $eq: [ '$profile', exclude ] }
                ]
              }
            }
          }
        ], 
        as: 'subscription_docs'
      }
    }, 
    {
      $addFields: {
        isSubscribed: {
          $cond: {
            if: { $gt: [ { $size: '$subscription_docs' }, 0 ] }, 
            then: true, 
            else: false
          }
        }
      }
    }
  ])
  if (exclude) q = q.match({ _id: { $ne: exclude } })
  return await q
}

export async function getProfile(id: String) : Promise<IProfile> {
  let data = await Profile.aggregate([
    {
      $match: {
        _id: id
      },
    },
    {
      $lookup: {
        from: "books",
        localField: "_id",
        foreignField: "author",
        as: "books",
        pipeline: [
          {
            $lookup: {
              from: "profiles",
              localField: "author",
              foreignField: "_id",
              as: "author"
            }
          },
          {
            $project: {
              author: {
                _id: 1, 
                name: 1, 
                displayName: 1,
                avatarUrl: 1
              },
              _id: 1,
              name: 1, 
              coverUrl: 1, 
            }
          },
          {
            $unwind: {
              path: "$author"
            }
          }
        ]
      }
    }
  ])
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
  })
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