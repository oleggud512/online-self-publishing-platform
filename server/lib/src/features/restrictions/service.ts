import { Restriction } from "./Restriction"

/**
 * returns permission state. (If the user can't publish book now, and you want 
 * to toggle this permission it will return true)
 */
export async function toggleRestriction(
  args: Omit<Restriction.IBase, "_id" | "before"> & { before?: Date }
): Promise<Boolean> {
  const { restriction, subject, subjectName, before } = args

  if (!Restriction.Name.values.includes(restriction)) {
    throw 'not a valid restriction.'
  } 

  const restrictionDoc = await Restriction.Model.findOne({ 
    subject, 
    restriction
  })

  if (restrictionDoc) { 
    await restrictionDoc.delete()
    return true
  }
  
  await new Restriction.Model({
    subject, 
    subjectName, 
    restriction, 
    before
  }).save()
  return false

}


export async function getRestrictions(subject: string) {
  return await Restriction.Model.aggregate<Restriction.IBase>()
    .match({
      $expr: {
        $eq: [
          { $toString: "$subject" },
          String(subject)
        ]
      }
    })
}


export async function deleteOutdatedRestrictions() {
  await Restriction.Model.deleteMany({
    before: {
      exists: true,
      $lt: new Date(),
    }
  })
}


export async function toggleBlocked(profileId: string, before?: Date) {
  await toggleRestriction({
    subject: profileId,
    subjectName: Restriction.Subject.profile,
    restriction: Restriction.Name.block,
    before: before
  })
}
