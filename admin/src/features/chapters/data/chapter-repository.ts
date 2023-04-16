import { HttpClient } from "aurelia-fetch-client";
import { Chapter } from "../domain/chapter";

export class ChapterRepository {
  constructor(private client: HttpClient) { }

  async getChapter(chapterId: string) : Promise<Chapter> {
    const resp = await this.client.fetch(`chapters/${chapterId}`, {
      method: 'GET'
    })
    const json = await resp.json()
    console.log({getChapter: json})
    if (json.error) throw json.error
    const chapter = new Chapter(json.data)
    return chapter
  }

}
