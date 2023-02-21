import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'log.dart';

// class PubSubEvent {}

class PubSubNotifier extends Notifier<PubSubEvent> {

  @override
  PubSubEvent build() => PubSubEvent();

  push(PubSubEvent nextEvent) => state = nextEvent;
}

final pubSub = NotifierProvider<PubSubNotifier, PubSubEvent>(
  () => PubSubNotifier()
);

typedef Subscriber<T extends PubSubEvent> = void Function(T event, void Function() cancel);

class PubSubSubscription {
  final Subscriber _subscriber;

  PubSubSubscription(this._subscriber);

  void cancel() {
    PubSub.instance.unsub(_subscriber);
  }
}

class PubSubEvent {}

class PubSub {
  PubSub._();

  static PubSub? _instance;

  static PubSub get instance {
    _instance ??= PubSub._();
    return _instance!;
  }

  final List<Subscriber> _subscribers = [];

  PubSubSubscription? sub(Subscriber subscriber) {
    if (_subscribers.contains(subscriber)) return null;
    _subscribers.add(subscriber);
    return PubSubSubscription(subscriber);
  }

  void unsub(Subscriber subscriber) {
    _subscribers.remove(subscriber);
  }

  void pub(PubSubEvent event) {
    for (final subscriber in _subscribers) {
      printSuccess('call subscriber');
      subscriber(event, () => unsub(subscriber));
    }
  }
}