import { HttpClient } from "aurelia-fetch-client";
import { Book } from "../domain/book";
import { BookPermissions } from "../domain/book-permissions";

export class BookRepository {
  constructor(private client: HttpClient) { }

  async getBook(id: string) {
    const resp = await this.client.fetch(`books/${id}`, { 
      method: 'GET' 
    })
    const json = await resp.json()
    return new Book(json.data)
  }

  async getPermissions(bookId: string) : Promise<BookPermissions> {
    const resp = await this.client.fetch(`books/${bookId}/permissions`, {
      method: 'GET'
    })
    const json = await resp.json()
    return new BookPermissions(json.data)
  }

  async togglePublish(bookId: string) : Promise<boolean> {
    const resp = await this.client.fetch(`books/${bookId}/permissions/publish`, {
      method: 'PUT'
    })
    const json = await resp.json()
    return json.data as boolean
  }
}
