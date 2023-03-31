import { autoinject } from "aurelia-framework"
import { DialogCloseResult, DialogController, DialogService } from "aurelia-dialog";

@autoinject
export class YesNoDialog {
  constructor(private cont: DialogController) { }

  message: string

  activate(params) {
    this.message = params.message ?? "Do you know?"
  }

  yes() {
    this.cont.close(true, true)
  }

  no() {
    this.cont.close(false, false)
  }

  static show(service: DialogService, message: string) {
    return new Promise<DialogCloseResult>((reslove, reject) => {
      service.open({ 
        lock: false, 
        viewModel: YesNoDialog, 
        model: { 
          message: message
        }
      }).whenClosed(function (resp) {
        reslove(resp)
      })
    })
  }
}