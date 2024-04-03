import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/pagination/page_list_widget.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/common/pagination/pagination_list_widget_controller.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// [callback] to fetch the data
class SimplePaginationListScreen<T> extends ConsumerWidget {
  SimplePaginationListScreen({super.key, 
    required this.callback,
    required this.itemBuilder,
    this.title = "List"
  });

  final String title;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final refreshController = RefreshController();

  final PaginationItemsCallback<T> callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paginationListWidgetControllerProvider(callback));
    final cont = ref.watch(paginationListWidgetControllerProvider(callback).notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true
      ),
      body: state.when(
        data: (items) => PageListWidget(
          paginationController: cont,
          refreshController: refreshController,
          child: ListView.separated(
            padding: const EdgeInsets.all(p16),
            itemCount: items.length,
            separatorBuilder: (context, index) => h16gap,
            itemBuilder: (context, i) {
              // return AuthorWidget(profile: items[i]);
              return itemBuilder(context, items[i]);
            }
          ),
        ),
        loading: defaultLoading,
        error: defaultErrorHandler
      )
    );
  }
}