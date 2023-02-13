import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListScreen<T> extends ConsumerStatefulWidget {
  const ListScreen({
    super.key, 
    required this.title,
    required this.watch,
    required this.itemBuilder
  });

  final AsyncValue<List<T>> Function(WidgetRef ref) watch;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListScreenState();
}
class _ListScreenState extends ConsumerState<ListScreen> {
  @override
  Widget build(BuildContext context) {
    final state = widget.watch(ref);
    return state.when(
      data: (list) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemExtent: p8,
          itemBuilder: (context, i) {
            return widget.itemBuilder(context, list[i]);
          }
        )
      ),
      loading: defaultLoading,
      error: defaultErrorHandler
    );
  }
}
