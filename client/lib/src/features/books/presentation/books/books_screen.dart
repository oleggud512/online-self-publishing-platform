import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooksScreen extends ConsumerStatefulWidget {
  const BooksScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => BooksScreenState();
}
class BooksScreenState extends ConsumerState<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    final ll = ref.watch(currentLocalizationProvider);
    return Container();
  }
}