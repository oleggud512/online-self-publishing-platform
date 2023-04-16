import { Entity, Identifiable, Owned } from "../../../domain"
import { Book } from "features/books/domain/book";
import { ReportState } from "./report-state";
import { ReportSubject } from "./report-subject";
import { Profile } from "features/profiles/domain/profile";
import { Comment } from "features/comments/domain/comment";
import { BaseCommentSubject } from "features/comments/domain/comment-subject";

export class BaseReportSubject implements Entity {
  _id: string
  createdAt?: Date
  updatedAt?: Date
}


export class Report implements Entity, Owned {
  _id: string;
  author: Profile;
  subject?: BaseReportSubject;
  subjectName: string;
  reportType: ReportType;
  state: string;
  description: string;

  admin?: Profile;
  actions?: Action[];

  createdAt: Date;
  updatedAt: Date;

  constructor(data: any) {
    this._id = data._id;
    if (data.admin) this.admin = new Profile(data.admin);
    this.author = new Profile(data.author);
    if (data.subject)
      this.subject = this._parseSubject(data.subject, data.subjectName);
    this.subjectName = data.subjectName;
    this.reportType = new ReportType(data.reportType);
    this.state = data.state;
    this.description = data.description

    if (data.actions && Array.isArray(data.actions)) {
      this.actions = data.actions.map((action) => this._parseAction(action));
    }

    if (data.createdAt) this.createdAt = new Date(data.createdAt);
    if (data.updatedAt) this.updatedAt = new Date(data.updatedAt);
  }

  private _parseSubject(data: any, subjectName: string): BaseReportSubject {
    switch (subjectName) {
      case ReportSubject.book:
        return new Book(data);
      case ReportSubject.profile:
        return new Profile(data);
      case ReportSubject.comment:
        return new Comment(data);
    }
  }

  private _parseAction(action: any) {
    if (!action || !action.actionType) return undefined;
    if (ActionType.isOfMessageGroup(action.actionType))
      return new MessageAction(action);
    if (ActionType.isOfProfileGroup(action.actionType))
      return new ProfileAction(action);
    if (ActionType.isOfBookGroup(action.actionType))
      return new BookAction(action);
    if (ActionType.isOfChapterGroup(action.actionType)) {
      console.log("IS OF CHAPTER GROUP");
      return new ChapterAction(action);
    }
  }

  public get isOnProfile() {
    // return this.subject instanceof Profile
    console.log(`IS ON PROFILE CALLED and returned ${
      this.subjectName == ReportSubject.profile
    }`);
    return this.subjectName === ReportSubject.profile;
  }
  
  public get isOnBook() {
    console.log(`IS ON BOOK CALLED and returned ${
      this.subjectName == ReportSubject.book}`);
    // return this.subject instanceof Book
    return this.subjectName === ReportSubject.book;
  }

  public get isOnComment() {
    // return this.subject instanceof Comment
    console.log(`IS ON COMMENT CALLED and returned ${
      this.subjectName == ReportSubject.comment}`);
    return this.subjectName === ReportSubject.comment;
  }
}

export class ActionType {
  static message = "message"
  static deleteComment = "deleteComment"

  static updateProfile = "updateProfile"
  static allowPublishBook = "allowPublishBook"
  static restrictPublishBook = "restrictPublishBook"
  static allowAddComment = "allowAddComment"
  static restrictAddComment = "restrictAddComment"

  static addBook = "addBook"
  static updateBook = "updateBook"
  static deleteBook = "deleteBook"
  static publishBook = "publishBook"
  static unpublishBook = "unpublishBook"
  static profileBlocked = "profileBlocked"
  static profileUnblocked = "profileUnblocked"

  static addChapter = "addChapter"
  static updateChapter = "updateChapter"
  static deleteChapter = "deleteChapter"
  static publishChapter = "publishChapter"
  static unpublishChapter = "unpublishChapter"
  static unpublishBookPermanently = "unpublishBookPermanently"
  static publishBookPermanently = "publishBookPermanently"

  static get values() {
    return [
      ActionType.message,
      ActionType.deleteComment,

      ActionType.updateProfile,
      ActionType.allowPublishBook,
      ActionType.restrictPublishBook,
      ActionType.allowAddComment,
      ActionType.restrictAddComment,
      ActionType.profileBlocked,
      ActionType.profileUnblocked,

      ActionType.addBook,
      ActionType.updateBook,
      ActionType.deleteBook,
      ActionType.publishBook,
      ActionType.unpublishBook,
      ActionType.unpublishBookPermanently,
      ActionType.publishBookPermanently,

      ActionType.addChapter,
      ActionType.updateChapter,
      ActionType.deleteChapter,
      ActionType.publishChapter,
      ActionType.unpublishChapter,
    ]
  }

  static isOfProfileGroup(actionType: string) : boolean { 
    return [
      ActionType.updateProfile,
      ActionType.allowPublishBook,
      ActionType.restrictPublishBook,
      ActionType.allowAddComment,
      ActionType.restrictAddComment,
      ActionType.profileBlocked,
      ActionType.profileUnblocked,
    ].includes(actionType)
  }

  static isOfBookGroup(actionType: string) : boolean { 
    return [
      ActionType.addBook,
      ActionType.updateBook,
      ActionType.deleteBook,
      ActionType.publishBook,
      ActionType.unpublishBook,
      ActionType.unpublishBookPermanently,
      ActionType.publishBookPermanently,
    ].includes(actionType)
  }

  static isOfChapterGroup(actionType: string) : boolean {
    return [
      ActionType.addChapter,
      ActionType.updateChapter,
      ActionType.deleteChapter,
      ActionType.publishChapter,
      ActionType.unpublishChapter,
    ].includes(actionType)
  }

  static isOfMessageGroup(actionType: string) : boolean { // just a text
    return [
      ActionType.message,
      ActionType.deleteComment,
    ].includes(actionType)
  }
}

export class Action implements Entity, Owned {
  _id: string
  actionType: string
  author: Profile
  report: string
  
  createdAt?: Date
  updatedAt?: Date

  constructor(data: any) {
    this._id = data._id
    this.actionType = data.actionType
    this.author = new Profile(data.author)
    this.report = data.report

    if (data.createdAt) this.createdAt = new Date(data.createdAt)
    if (data.updatedAt) this.updatedAt = new Date(data.updatedAt)
  }
}

// в Action есть author. Если actionType == updateProfile, то это значит 
// что профиль автора этого Action был обновлен
export class ProfileAction extends Action {
  profile: {
    _id: string
    name: string
  }

  constructor(data: any) { 
    super(data) 
    if (!data.profile) {
      this.profile = {
        _id: "no",
        name: "no"
      }
      return
    }
    this.profile = data.profile
  }
}


export class MessageAction extends Action {
  content: string

  constructor(data: any) {
    super(data)
    this.content = data.content
  }
}


export class BookAction extends Action {
  book: {
    _id: string
    name: string
  }

  constructor(data: any) {
    super(data)
    if (!data.book) {
      this.book = {
        _id: "no",
        name: "&lt;&lt;deleted bookj&gt;&gt;"
      }
      return
    }
    this.book = data.book
  }
}


export class ChapterAction extends BookAction {
  chapter: {
    _id: string
    name: string
  }

  constructor(data: any) {
    super(data)
    if (!data.chapter) {
      this.chapter = {
        _id: "no",
        name: "&lt;&lt;deleted chapter&gt;&gt"
      }
      return
    }
    this.chapter = data.chapter
  }
}


export class ReportType implements Identifiable {
  _id: string
  description: string
  displayName: string
  name: string
  subjectName: string[]

  constructor(data: any) {
    this._id = data._id
    this.description = data.description
    this.displayName = data.displayName
    this.name = data.name
    this.subjectName = data.subjectName
  }
}
