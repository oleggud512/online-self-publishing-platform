import 'dart:async';

class Debouncer {
  final int milliseconds;

  Debouncer([this.milliseconds = 800]);

  Timer? _timer;

  debounce(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), callback);
  }

  dispose() { 
    _timer?.cancel();
  }
}