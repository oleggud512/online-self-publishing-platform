import 'package:flutter_riverpod/flutter_riverpod.dart';

class PubSubEvent {}

final pubSub = StateProvider<PubSubEvent>((ref) => PubSubEvent());