import { bindable, View, bindingMode } from "aurelia-framework"
import { SegmentButton } from "./segment-button"

export class SegmentedButtonsCustomElement {
  @bindable({ defaultBindingMode: bindingMode.twoWay }) segments: SegmentButton[] = []
  @bindable({ defaultBindingMode: bindingMode.twoWay }) value: any
  @bindable name: string
  @bindable required: boolean = false
  @bindable onChanged?: (value: any) => {}

  onSegment(newV) {
    if (newV == this.value && !this.required) {
      this.value = undefined
    } else {
      this.value = newV
    }
    if (this.onChanged) this.onChanged(this.value)
  }
}