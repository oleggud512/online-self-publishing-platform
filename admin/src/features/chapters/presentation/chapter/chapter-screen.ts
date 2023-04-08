import { autoinject } from "aurelia-framework"
import { ChapterRepository } from "features/chapters/data/chapter-repository";
import { Chapter } from "features/chapters/domain/chapter";
import { Router, RouterConfiguration, NavigationInstruction } from "aurelia-router"
import { MyRoute } from "router";
import * as nprog from "nprogress"

@autoinject
export class ChapterScreen {
  chapterId: string
  chapter: Chapter
  
  constructor(private router: Router, private chapterRepo: ChapterRepository) { }

  activate(params, routeConfig, navigationInstruction) {
    this.chapterId = params.id
    this.refresh()
  }

  async refresh() {
    nprog.start()
    this.chapter = await this.chapterRepo.getChapter(this.chapterId)
    nprog.done()
  }

  onBookClicked() {
    this.router.navigateToRoute(MyRoute.book, { id: this.chapter.book._id })
  }
}
