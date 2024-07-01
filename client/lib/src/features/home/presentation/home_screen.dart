import 'package:client/src/common/widgets/see_all_header.dart';
import 'package:client/src/features/home/presentation/home_screen_controller.dart';
import 'package:client/src/features/profile/presentation/authors/author_widget.dart';
import 'package:flutter/material.dart';
import 'package:client/src/shared/errors/map_error_to_widget.dart';
import 'package:client/src/shared/errors/widgets/default_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/constants.dart';
import '../../../shared/constants.dart';
import '../../books/presentation/book_list/book_list_widget.dart';
import 'package:client/src/common/build_context_ext.dart';
import 'home_screen_app_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ll = context.ll!;
    final cont = ref.watch(homeScreenControllerProvider.notifier);
    final state = ref.watch(homeScreenControllerProvider);

    return Scaffold(
      appBar: const HomeScreenAppBar(),
      body: state.when(
        data: (state) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(p16),
              child: SeeAllHeader(
                labelText: ll.book.popularBooks,
                onSeeAll: () {
                  context.pushNamed(MyRoute.popularBooks.name);
                },
              ),
            ),
            BookListWidget(books: state.books),
            Padding(
              padding: const EdgeInsets.all(p16),
              child: SeeAllHeader(
                labelText: ll.profile.popularAuthors,
                onSeeAll: () {
                  context.pushNamed(MyRoute.popularAuthors.name);
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    w16gap,
                    for (final author in state.authors) ...[
                      AuthorWidget(
                        profile: author, 
                        listDirection: Axis.horizontal
                      ),
                      w16gap
                    ],
                    w16gap,
                  ]
                ),
              )
            ),
          ],
        ),
        error: (e, st) => mapErrorToWidget(e, st, 
          connectionErrorAction: (context) {
            cont.refresh();
          }
        ),
        loading: defaultLoading
      )
    );
  }
}
