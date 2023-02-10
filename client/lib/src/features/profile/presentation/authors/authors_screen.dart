import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorsScreen extends ConsumerStatefulWidget {
  const AuthorsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthorsScreenState();
}
class _AuthorsScreenState extends ConsumerState<AuthorsScreen> {
  @override
  Widget build(BuildContext context) {
    final ll = ref.watch(currentLocalizationProvider);
    return Container();
  }
}