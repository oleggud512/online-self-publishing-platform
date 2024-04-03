import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/auth/data/auth_repository.dart';
import 'package:client/src/features/auth/presentation/auth_screen.dart';
import 'package:client/src/features/books/presentation/books/books_screen.dart';
import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:client/src/features/home/presentation/home_screen.dart';
import 'package:client/src/features/home/presentation/popular_books_screen.dart';
import 'package:client/src/features/messages/domain/chat.dart';
import 'package:client/src/features/messages/presentation/chat/chat_screen.dart';
import 'package:client/src/features/messages/presentation/chats/chats_screen.dart';
import 'package:client/src/features/notifications/presentation/notifications_screen.dart';
import 'package:client/src/features/profile/application/currently_edited_profile.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/features/profile/presentation/profile/profile_screen.dart';
import 'package:client/src/router/scaffold_with_navigation.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../features/books/domain/book.dart';
import '../features/books/presentation/book/book_screen.dart';
import '../features/books/presentation/book_filters/books_filters_screen.dart';
import '../features/books/presentation/books/profile_books_screen.dart';
import '../features/books/presentation/edit_book/edit_book_screen.dart';
import '../features/chapters/presentation/chapter/chapter_screen.dart';
import '../features/chapters/presentation/chapters/book_chapters_screen.dart';
import '../features/chapters/presentation/edit_chapter/edit_chapter_screen.dart';
import '../features/home/presentation/popular_authors_screen.dart';
import '../features/profile/presentation/authors/authors_screen.dart';
import '../features/profile/presentation/bookmarks/bookmarks_screen.dart';
import '../features/profile/presentation/edit_profile_screen/edit_profile_screen.dart';
import '../features/profile/presentation/profile/subscribers_screen.dart';
import '../features/profile/presentation/profile/subscriptions_screen.dart';
import '../features/settings/presentation/settings_screen.dart';

extension MyRoutePath on MyRoute {
  String get path {
    switch (this) {
      case MyRoute.root:
        return '/';
      case MyRoute.auth:
        return '/auth';

      case MyRoute.home:
        return '/home';
      case MyRoute.chats:
        return '/chats';
      // case MyRoute.authors: return '/authors';
      case MyRoute.profiles:
        return '/profiles';
      case MyRoute.books:
        return '/books';
      case MyRoute.bookFilters:
        return '/books/filters';
      case MyRoute.myProfile:
        return '/myProfile';

      case MyRoute.settings:
        return '/settings';
      case MyRoute.notifications:
        return '/notifications';
      case MyRoute.bookmarks:
        return '/bookmarks';

      case MyRoute.chat:
        return '/chats/:id';
      case MyRoute.book:
        return '/books/:id';
      case MyRoute.editBook:
        return '/books/:id/edit';
      case MyRoute.addBook:
        return '/profiles/:id/books/add';
      case MyRoute.profile:
        return '/profiles/:id';
      case MyRoute.editProfile:
        return '/profiles/:id/edit';
      case MyRoute.profileBooks:
        return '/profiles/:id/books';
      case MyRoute.subscribers:
        return '/profiles/:id/subscribers';
      case MyRoute.subscriptions:
        return '/profiles/:id/subscriptions';

      case MyRoute.chapters: 
        return '/books/:id/chapters';
      case MyRoute.addChapter:
        return '/books/:id/chapters/add';
      case MyRoute.chapter:
        return '/chapters/:id';
      case MyRoute.editChapter:
        return '/chapters/:id/edit';

      case MyRoute.blocked:
        return '/blocked';

      case MyRoute.popularBooks:
        return '/books/popular';
      case MyRoute.popularAuthors:
        return '/profiles/popular';
    }
  }
}

final routerProvider = Provider((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    // redirect: (context, state) {
    //   final isLoggedIn = ref.watch(authRepositoryProvider).currentUser != null;
    //   print("redirect isLoggedIn = $isLoggedIn state.location = ${state.location}");
    //   if (isLoggedIn && (state.location == '/auth' || state.location == '/')) {
    //     print('redirect to /home');
    //     return '/home';
    //   } else if (!isLoggedIn && state.location != '/auth') {
    //     print('redirect to /auth');
    //     return '/auth';
    //   }
    //   return null;
    // },
    // refreshListenable: GoRouterRefreshStream(ref.watch(authRepositoryProvider).userChanges),
    initialLocation: MyRoute.home.path,
    routes: [
      ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithNavigation(child: child);
          },
          routes: [
            GoRoute(
              path: MyRoute.popularAuthors.path,
              name: MyRoute.popularAuthors.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: PopularAuthorsScreen()
                );
              }
            ),
            GoRoute(
              path: MyRoute.popularBooks.path,
              name: MyRoute.popularBooks.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: PopularBooksScreen()
                );
              }
            ),
            GoRoute(
              path: MyRoute.home.path,
              name: MyRoute.home.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: const HomeScreen(),
                );
              },
            ),
            GoRoute(
                path: MyRoute.chats.path,
                name: MyRoute.chats.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const ChatsScreen(),
                  );
                }),
            GoRoute(
                path: MyRoute.books.path,
                name: MyRoute.books.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const BooksScreen(),
                  );
                },
                routes: [
                  GoRoute(
                      path: 'filters',
                      name: MyRoute.bookFilters.name,
                      pageBuilder: (context, state) {
                        return const NoTransitionPage(
                            child: BooksFiltersScreen());
                      })
                ]),
            GoRoute(
              path: MyRoute.book.path,
              name: MyRoute.book.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child:
                        BookScreen(bookId: state.pathParameters['id'] as String));
              },
              routes: [
                GoRoute(
                  path: 'edit',
                  name: MyRoute.editBook.name,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      child: EditBookScreen(book: state.extra as Book),
                    );
                  },
                ),
                GoRoute(
                  path: 'chapters',
                  name: MyRoute.chapters.name,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      child: BookChaptersScreen(
                        bookId: state.pathParameters['id'] as String,
                        book: state.extra as Book
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'add',
                      name: MyRoute.addChapter.name,
                      pageBuilder: (context, state) {
                        return NoTransitionPage(
                          child: EditChapterScreen.add(
                            forBook: state.extra as Book
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: MyRoute.profiles.path,
              name: MyRoute.profiles.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: const AuthorsScreen(),
                );
              },
            ),
            GoRoute(
                path: MyRoute.profile.path,
                name: MyRoute.profile.name,
                builder: (context, state) {
                  Logger()
                      .i("GoRoute(/profile/:id) id='${state.pathParameters['id']}'");
                  String profileId = state.pathParameters['id'] as String;
                  print('go to this $profileId profileId');
                  return Consumer(builder: (context, ref, child) {
                    return ProfileScreen(profileId: profileId);
                  });
                },
                routes: [
                  GoRoute(
                      path: 'edit',
                      name: MyRoute.editProfile.name,
                      builder: (context, state) {
                        return ProviderScope(
                          overrides: [
                            currentlyEditedProfileProvider
                                .overrideWith((ref) {
                              return state.extra as Profile;
                            })
                          ],
                          child: const EditProfileScreen(),
                        );
                      }),
                  GoRoute(
                      path: 'subscribers',
                      name: MyRoute.subscribers.name,
                      builder: (context, state) {
                        return SubscribersScreen(
                            profileId: state.pathParameters['id'] as String);
                      }),
                  GoRoute(
                      path: 'subscriptions',
                      name: MyRoute.subscriptions.name,
                      builder: (context, state) {
                        return SubscriptionsScreen(
                          profileId: state.pathParameters['id'] as String,
                        );
                      }),
                  GoRoute(
                      path: 'books',
                      name: MyRoute.profileBooks.name,
                      builder: (context, state) {
                        return ProfileBooksScreen(
                            ofProfile: state.pathParameters['id']!);
                      },
                      routes: [
                        GoRoute(
                            path: 'add',
                            name: MyRoute.addBook.name,
                            pageBuilder: (context, state) {
                              return NoTransitionPage(
                                  child: EditBookScreen.add(
                                      state.pathParameters['id']!) // id - profile id
                                  );
                            })
                      ]
                  )
                ]),
            GoRoute(
              path: MyRoute.myProfile.path,
              name: MyRoute.myProfile.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: Consumer(builder: (context, ref, child) {
                    // я передаю сюда ref.watch(myIdProvider) вместо того чтобы
                    // делать это в середине, потому что я использую ProfileScreen
                    // так же для того чтобы просматривать чужие профили
                    return ProfileScreen(profileId: ref.watch(myIdProvider));
                  }),
                );
              },
            ),
            GoRoute(
                path: MyRoute.notifications.path,
                name: MyRoute.notifications.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      key: state.pageKey, child: const NotificationsScreen());
                }),
            GoRoute(
                path: MyRoute.bookmarks.path,
                name: MyRoute.bookmarks.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      key: state.pageKey, child: BookmarksScreen());
                }),
            GoRoute(
              path: MyRoute.settings.path,
              name: MyRoute.settings.name,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    key: state.pageKey, child: const SettingsScreen());
              },
            ),
          ]
        ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyRoute.chapter.path,
        name: MyRoute.chapter.name,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: ChapterScreen(
              chapterId: state.pathParameters['id'] as String,
            ),
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: rootNavigatorKey,
            path: 'edit',
            name: MyRoute.editChapter.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: EditChapterScreen(chapter: state.extra as Chapter)
              );
            }
          )
        ]
      ),
      GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: MyRoute.chat.path,
          name: MyRoute.chat.name,
          pageBuilder: (context, state) {
            Chat chat = state.extra as Chat;
            return NoTransitionPage(
                key: state.pageKey, child: ChatScreen(chat: chat));
          }),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyRoute.root.path,
        name: MyRoute.root.name,
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text("'/'"),
          ),
        ),
      ),
      GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: MyRoute.auth.path,
          name: MyRoute.auth.name,
          builder: (context, state) {
            return ProviderScope(overrides: [
              currentlyEditedProfileProvider.overrideWith((ref) {
                return Profile();
              })
            ], child: const AuthScreen());
          }),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyRoute.blocked.path,
        name: MyRoute.blocked.name,
        builder: (context, state) {
          return const BlockedScreen();
        }
      )
    ]
  );
});

class BlockedScreen extends ConsumerWidget {
  const BlockedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.ll!.auth.blocked, 
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            FilledButton.icon(
              onPressed: () {
                ref.watch(authRepositoryProvider).signOut();
              }, 
              icon: const Icon(Icons.logout_rounded),
              label: Text(context.ll!.auth.signOut)
            )
          ],
        )
      )
    );
  }
}
