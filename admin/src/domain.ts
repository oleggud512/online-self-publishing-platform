import { Profile } from "features/profiles/domain/profile"

export class Identifiable {
  _id: string
}


export class Owned {
  author: Profile
}


export class Entity implements Identifiable {
  _id: string
  createdAt?: Date
  updatedAt?: Date
}

