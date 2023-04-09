import { autoinject } from "aurelia-framework"
import * as tmp from "aurelia-templating-resources"
import { ChapterRepository } from "features/chapters/data/chapter-repository";
import { Chapter } from "features/chapters/domain/chapter";
import { Router, RouterConfiguration, NavigationInstruction } from "aurelia-router"
import { MyRoute } from "router";
import * as nprog from "nprogress"
import Quill from "quill"
import * as dp from "dompurify"

@autoinject
export class ChapterScreen {
  chapterId: string
  chapter: Chapter

  output: string
  
  constructor(private router: Router, private chapterRepo: ChapterRepository) { }

  activate(params, routeConfig, navigationInstruction) {
    this.chapterId = params.id
    this.refresh()
  }

  async refresh() {
    nprog.start()
    this.chapter = await this.chapterRepo.getChapter(this.chapterId)
    nprog.done()
    const quill = new Quill(document.createElement('div'))
    quill.setContents(JSON.parse(this.chapter.content))
    const html = quill.root.innerHTML
    this.output = dp.sanitize(html)
  }

  onBookClicked() {
    this.router.navigateToRoute(MyRoute.book, { id: this.chapter.book._id })
  }
}
