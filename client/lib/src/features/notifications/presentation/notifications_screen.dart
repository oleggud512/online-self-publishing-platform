import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationsScreenState();
}
class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final ll = ref.watch(currentLocalizationProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(ll.screenTitle.notifications)
      )
    );
  }
}