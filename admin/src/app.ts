import { RouterConfiguration, Router } from "aurelia-router"
import * as myRouter from "router"

export class App {
  router: Router

  configureRouter(config: RouterConfiguration, router: Router) {
    this.router = router
    myRouter.configureRouter(config, router)
  }
}
