
import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/pagination/page_list_widget.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/profile/presentation/authors/author_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'authors_screen_app_bar.dart';
import 'authors_screen_controller.dart';

class AuthorsScreen extends ConsumerStatefulWidget {
  const AuthorsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthorsScreenState();
}
class _AuthorsScreenState extends ConsumerState<AuthorsScreen> {
  final refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authorsScreenControllerProvider);

    return Scaffold(
      appBar: AuthorsAppBar(),
      body: state.when(
        data: (authors) => PageListWidget(
          paginationController: ref.watch(authorsScreenControllerProvider.notifier),
          refreshController: refreshController, 
          child: ListView.separated(
            padding: const EdgeInsets.all(p8),
            separatorBuilder: (context, i) => h8gap,
            itemCount: authors.length,
            itemBuilder: (context, index) {
              return AuthorWidget(profile: authors[index]);
            },
          ),
        ),
        loading: defaultLoading,
        error: defaultErrorHandler
      )
    );
  }
}
