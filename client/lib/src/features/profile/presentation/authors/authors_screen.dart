import 'dart:async';

import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/pagination/page_list_widget.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/profile/presentation/authors/author_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/log.dart';
import '../../domain/profile.dart';
import 'authors_screen_controller.dart';

class AuthorsScreen extends ConsumerStatefulWidget {
  const AuthorsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthorsScreenState();
}
class _AuthorsScreenState extends ConsumerState<AuthorsScreen> {
  final refreshController = RefreshController();

  void refresh() async {
    await ref.read(authorsScreenControllerProvider.notifier).refresh();
    refreshController.refreshCompleted();
    refreshController.loadComplete();
  }

  void addPage() async {
    printInfo('addPage()');
    bool loaded = await ref.read(authorsScreenControllerProvider.notifier)
      .addPage();
    if (loaded) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ll = ref.watch(currentLocalizationProvider);
    final state = ref.watch(authorsScreenControllerProvider);
    
    return state.when(
      data: (authors) {
        return PageListWidget(
          paginationController: ref.watch(authorsScreenControllerProvider.notifier),
          refreshController: refreshController, 
          child: ListView.builder(
            itemCount: authors.length,
            itemBuilder: (context, index) {
              return AuthorWidget(profile: authors[index]);
            },
          ),
        );
      },
      loading: defaultLoading,
      error: defaultErrorHandler,
    );
  }
}