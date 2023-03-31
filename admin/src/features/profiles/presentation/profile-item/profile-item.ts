import { bindable, View, autoinject } from "aurelia-framework"
import { Profile } from "features/profiles/domain/profile"

@autoinject
export class ProfileItemCustomElement {
  @bindable profile: Profile
  @bindable withCard: boolean = true

  public hasSlot = false

  constructor(private element: Element) {}

  attached() {
    if (this.element.querySelector('#slotContainer').children.length > 1) {
      this.hasSlot = true
    }
  }
}