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

export async function getProfiles() : Promise<Array<IProfile>> {
  return []
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