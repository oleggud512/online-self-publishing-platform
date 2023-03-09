import { bindable } from "aurelia-framework"
import { Profile } from "features/reports/domain/report"

export class ProfileItemCustomElement {
  @bindable profile: Profile
}