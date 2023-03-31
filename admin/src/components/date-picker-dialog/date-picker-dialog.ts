import { DialogCloseResult, DialogController, DialogService } from "aurelia-dialog";
import { autoinject } from "aurelia-framework";

@autoinject
export class DatePickerDialog {
  date: Date
  message: string

  constructor(private cont: DialogController) { }

  activate(params) {
    this.message = params.message ?? 'Enter date'
  }

  submit() {
    this.cont.close(true, this.date)
  }

  cancel() {
    this.cont.close(false)
  }

  static show(service: DialogService, message: string) {
    return new Promise<DialogCloseResult>((resolve, reject) => {
      service.open({
        lock: false,
        viewModel: DatePickerDialog,
        model: {
          message: message
        }
      }).whenClosed((res) => {
        resolve(res)
      })
    })
  }
}