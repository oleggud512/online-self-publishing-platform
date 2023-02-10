import { Role } from "./Role"

export type FireUser = {
  uid: string,
  dispalyName?: string,
  email: string,
  role: Role,
  allowComment?: boolean,
  allowPublish?: boolean,
}
