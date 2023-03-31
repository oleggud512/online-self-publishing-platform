import { bindable, autoinject } from "aurelia-framework"
import { Router } from "aurelia-router"
import { Action, BookAction, ChapterAction, MessageAction, ProfileAction } from "features/reports/domain/report"
import i18next from "i18next"
import * as dpf from "dompurify"
import { MyRoute } from "router"

@autoinject
export class ActionItem {
  public t = i18next.t
  
  @bindable action: Action
  markColor: string

  constructor(private element: Element, private router: Router) { }

  attached() {
    this.element.querySelector("#actionContent")
      .insertAdjacentHTML('beforeend', this.actionToString())
      // .appendChild(this.actionToString())
  }

  actionToString() : string {
    var text: string

    if (this.action instanceof MessageAction) {
      text = this.action.content
      this.markColor = 'message'
    } else if (this.action instanceof ProfileAction) {
      text = this.t(this.action.actionType, { 
        name: `<a href="${this.router.generate(MyRoute.profile, { id: this.action.author._id })}">${this.action.author.name}</a>`
      })
      this.markColor = 'profile'
    } else if (this.action instanceof ChapterAction) {
      console.log("som")
      console.log(`<a href='${this.router.generate(MyRoute.chapter, { id: this.action.chapter._id })}'>${this.action.chapter.name}</a>`)
      text = this.t(this.action.actionType, {
        chapter: `<a href='${this.router.generate(MyRoute.chapter, { id: this.action.chapter._id })}'>${this.action.chapter.name}</a>`,
        book: `<a href='${this.router.generate(MyRoute.book, { id: this.action.book._id })}'>${this.action.book.name}</a>`,
      })
      this.markColor = 'chapter'
    } else if (this.action instanceof BookAction) {
      text = this.t(this.action.actionType, { 
        book: `<a href="${this.router.generate(MyRoute.book, { id: this.action.book._id })}">${this.action.book.name}</a>`
      })
      this.markColor = 'book'
    }

    // var html = dpf.sanitize(text)
    // console.log(html)
    // return html.querySelector('body')
    // return this.htmlToElement(text)
    return this.sanitize(text)
  }

  sanitize(html: string) {
    var template = document.createElement('template') as HTMLTemplateElement;
    html = html.trim(); // Never return a text node of whitespace as the result
    template.innerHTML = html;
    console.log(template.content.firstChild)
    return template.content.firstChild.textContent;
  }
}