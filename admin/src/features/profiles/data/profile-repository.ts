import { HttpClient } from "aurelia-fetch-client";
import qs from "qs";
import { Profile } from "../domain/profile";
import { ProfilePermissions } from "../domain/profile-permissions";

export class ProfileRepository {
  constructor(private client: HttpClient) { }

  async getProfile(profileId: string) {
    const resp = await this.client.fetch(`profiles/${profileId}`, {
      method: 'GET'
    })
    const json = await resp.json()
    console.log({ getProfile: json })
    const profile = new Profile(json.data)
    return profile
  }

  async getPermissions(profileId: string) {
    const resp = await this.client.fetch(`profiles/${profileId}/permissions`, {
      method: 'GET'
    })
    const json = await resp.json()
    const permissions = new ProfilePermissions(json.data)
    console.log({json, permissions})
    return permissions
  }

  async togglePublishBook(profileId: string, before?: Date) : Promise<boolean> {
    const resp = await this.client.fetch(`profiles/${profileId}/permissions/publish`, {
      method: 'PUT'
    })
    return (await resp.json()).data as boolean
  }

  async toggleAddComment(profileId: string, before?: Date) {
    const q = qs.stringify({before})
    
    const resp = await this.client.fetch(`profiles/${profileId}/permissions/comment?${q}`, {
      method: 'PUT',
      body: JSON.stringify({ before })
    })
    const json = await resp.json()
    console.log(json)
    return json.data as boolean
  }

  async toggleBlocked(profileId: string, before?: Date) : Promise<boolean> {
    const resp = await this.client.fetch(`users/${profileId}/blocked`, {
      method: 'PUT'
    })
    const json = await resp.json()
    console.log({ toggleBlocked: json })
    return json.data as boolean
  }

  async isBlocked(profileId: string) : Promise<boolean> {
    const resp = await this.client.fetch(`users/${profileId}/blocked`, {
      method: 'GET'
    })
    const json = await resp.json()
    return json.data as boolean
  }
}