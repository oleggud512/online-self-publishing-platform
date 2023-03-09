import { autoinject } from "aurelia-framework"
import { Router, RouterConfiguration, NavigationInstruction } from "aurelia-router"
import { Profile } from "features/reports/domain/report"


@autoinject
export class ProfileScreen {

  constructor(private router: Router) {}

  activate(params, routerConfig: RouterConfiguration, inst: NavigationInstruction) {
    
  }
  
  profile?: Profile
}