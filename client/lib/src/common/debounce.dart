import 'dart:async';

class Debouncer {
  int milliseconds;

  Debouncer([this.milliseconds = 800]);

  Timer? timer;

  debounce(void Function() callback) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds), callback);
  }
}