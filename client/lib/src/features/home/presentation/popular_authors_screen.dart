import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/pagination/page_list_widget.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/common/pagination/pagination_list_widget_controller.dart';
import 'package:client/src/shared/pagination_list_callback_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widgets/error_handler.dart';
import '../../profile/domain/profile.dart';
import '../../profile/presentation/authors/author_widget.dart';

class PopularAuthorsScreen extends ConsumerWidget {
  PopularAuthorsScreen({super.key});

  final refreshController = RefreshController();
  PaginationItemsCallback<Profile>? callback;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    callback ??= PaginationCallbackFactory.instance
      .createPopularAuthorsCallback(ref);

    final state = ref.watch(paginationListWidgetControllerProvider(callback!));
    final cont = 
      ref.watch(paginationListWidgetControllerProvider(callback!).notifier);

    return Scaffold(
      appBar: AppBar(title: Text(context.ll!.profile.popularAuthors)),
      body: state.when(
        data: (authors) => PageListWidget(
          paginationController: cont,
          refreshController: refreshController,
          child: ListView.separated(
            padding: const EdgeInsets.all(p8),
            separatorBuilder: (context, i) => h8gap,
            itemCount: authors.length,
            itemBuilder: (context, index) {
              return AuthorWidget(
                profile: authors[index],
                listDirection: Axis.vertical
              );
            },
          ),
        ),
        loading: defaultLoading,
        error: defaultErrorHandler
      )
    );
  }
}
