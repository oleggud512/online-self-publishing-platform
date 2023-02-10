import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/localization/application/current_locale.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  const ChatsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatsScreenState();
}
class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    final ll = ref.watch(currentLocalizationProvider);
    return Container();
  }
}