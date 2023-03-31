import { Identifiable } from "../../../domain"

export class BaseCommentSubject implements Identifiable {
  _id: string
}

export enum CommentSubject {
  book = 'Book',
  chapter = 'Chapter'
}


export function parseCommentSubject(data: string) {
  switch (data) {
    case 'Book': return CommentSubject.book
    case 'Chapter': return CommentSubject.chapter
  }
  throw `incorrect data ${data}`
}
