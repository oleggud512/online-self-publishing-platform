import * as nprogress from 'nprogress';
import {bindable, noView, PLATFORM} from 'aurelia-framework';
import 'nprogress/nprogress.css';

@noView
export class LoadingIndicator {
  constructor() {
    console.log('LoadingIndicator initialized')
  }
  @bindable loading = false;

  loadingChanged(newValue: boolean) {
    if (newValue) {
      nprogress.start();
    } else {
      nprogress.done();
    }
  }
}
