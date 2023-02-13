import 'package:client/src/common/pagination/page_list_widget.dart';
import 'package:client/src/common/pagination/pagination_list_widget_controller.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/profile/application/current_profile_id.dart';
import 'package:client/src/features/profile/data/profile_repository.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/features/profile/presentation/authors/author_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// [callback] to fetch the data
class SimpleProfileListScreen extends ConsumerWidget {
  SimpleProfileListScreen({super.key, 
    required this.callback,
    this.title = "List"
  });

  final String title;
  final refreshController = RefreshController();

  PaginationItemsCallback<Profile> callback;

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
        data: (subscribers) => PageListWidget(
          paginationController: cont,
          refreshController: refreshController,
          child: ListView.builder(
            itemCount: subscribers.length,
            itemBuilder: (context, i) {
              return AuthorWidget(profile: subscribers[i]);
            }
          ),
        ),
        loading: defaultLoading,
        error: defaultErrorHandler
      )
    );
  }
}