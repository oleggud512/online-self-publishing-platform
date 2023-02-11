import 'package:client/src/common/go_router_refresh_stream.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/auth/data/auth_repository.dart';
import 'package:client/src/features/auth/presentation/auth_screen.dart';
import 'package:client/src/features/books/presentation/books/books_screen.dart';
import 'package:client/src/features/home/presentation/home_screen.dart';
import 'package:client/src/features/messages/presentation/chats/chats_screen.dart';
import 'package:client/src/features/notifications/presentation/notifications_screen.dart';
import 'package:client/src/features/profile/application/current_profile_id.dart';
import 'package:client/src/features/profile/application/currently_edited_profile.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/features/profile/presentation/profile/profile_screen.dart';
import 'package:client/src/router/scaffold_with_navigation.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/profile/presentation/authors/authors_screen.dart';
import '../features/profile/presentation/edit_profile_screen/edit_profile_screen.dart';
import '../features/settings/presentation/settings_screen.dart';

extension MyRoutePath on MyRoute {
  String get path {
    switch (this) {
      case MyRoute.root: return '/';
      case MyRoute.auth: return '/auth';

      case MyRoute.home: return '/home';
      case MyRoute.chats: return '/chats';
      case MyRoute.authors: return '/authors';
      case MyRoute.books: return '/books';
      case MyRoute.myProfile: return '/myProfile';

      case MyRoute.settings: return '/settings';
      case MyRoute.notifications: return '/notifications';
      case MyRoute.chat: return '/chats/:id';
      case MyRoute.editBook: return '/books/:id/edit';
      case MyRoute.profile: return '/profiles/:id';
      case MyRoute.editProfile: return '/profiles/:id/edit';

      case MyRoute.chapter: return '/chapters/:id';
      case MyRoute.editChapter: return '/chapters/:id/edit';
    }
  }
}


final routerProvider = Provider((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      final isLoggedIn = ref.watch(authRepositoryProvider).currentUser != null;
      print("redirect isLoggedIn = $isLoggedIn state.location = ${state.location}");
      if (isLoggedIn && (state.location == '/auth' || state.location == '/')) {
        print('redirect to /home');
        return '/home';
      } else if (!isLoggedIn && state.location != '/auth') {
        print('redirect to /auth');
        return '/auth';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(ref.watch(authRepositoryProvider).userChanges),
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithNavigation(child: child);
        },
        routes: [
          GoRoute(
            path: MyRoute.home.path,
            name: MyRoute.home.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: HomeScreen(),
              );
            },
          ),
          GoRoute(
            path: MyRoute.chats.path,
            name: MyRoute.chats.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: ChatsScreen(),
              );
            }
          ),
          GoRoute(
            path: MyRoute.books.path,
            name: MyRoute.books.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: BooksScreen(),
              );
            }
          ),
          GoRoute(
            path: MyRoute.authors.path,
            name: MyRoute.authors.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: AuthorsScreen(),
              );
            },
          ),
          GoRoute(
            path: MyRoute.myProfile.path,
            name: MyRoute.myProfile.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: ProviderScope(
                  overrides: [
                    currentProfileIdProvider.overrideWith((ref) => ref.watch(myIdProvider) ?? "no id") // TODO: нужно отображать что "ты не зарегистрирован поэтому иди нахуй". 
                  ],
                  child: const ProfileScreen()
                ),
              );
            },
          ),
          GoRoute(
            // parentNavigatorKey: rootNavigatorKey,
            path: MyRoute.settings.path,
            name: MyRoute.settings.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const SettingsScreen()
              );
            },
          ),
          GoRoute(
            // parentNavigatorKey: rootNavigatorKey,
            path: MyRoute.notifications.path,
            name: MyRoute.notifications.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const NotificationsScreen()
              );
            }
          ),
        ]
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyRoute.root.path,
        name: MyRoute.root.name,
        builder: (context, state) =>
          Scaffold(
            appBar: AppBar(
              title: const Text("'/'"),
            ),
          ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyRoute.profile.path,
        name: MyRoute.profile.name,
        builder: (context, state) {
          String profileId = state.params['id'] as String;
          return ProviderScope(
            overrides: [
              currentProfileIdProvider.overrideWith((ref) => profileId)
            ],
            child: const ProfileScreen()
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: rootNavigatorKey,
            path: 'edit',
            name: MyRoute.editProfile.name,
            builder: (context, state) {
              return ProviderScope(
                overrides: [
                  currentlyEditedProfileProvider.overrideWith((ref) {
                    return state.extra as Profile;
                  })
                ],
                child: const EditProfileScreen(),
              );
            }
          )
        ]
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyRoute.auth.path,
        name: MyRoute.auth.name,
        builder: (context, state) {
          return ProviderScope(
            overrides: [
              currentlyEditedProfileProvider.overrideWith((ref) {
                return Profile();
              })
            ],
            child: const AuthScreen()
          );
        }
      ),
      /*
      GoRoute(
        path: '/home',
        name: R.routes.home,
        builder: (context, state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: '/settings',
        name: R.routes.settings,
        builder: (context, state) {
          return const SettingsScreen();
        }
      ),
      GoRoute(
        path: '/profiles',
        name: R.routes.authors,
        builder: (context, state) {
          return Scaffold(appBar: AppBar(title: Text("profile list")));
        }
      ),
      GoRoute(
        path: '/profiles/:id',
        name: R.routes.profile,
        builder: (context, state) {
          String profileId = state.queryParams['id'] as String;
          return ProviderScope(
            overrides: [
              currentProfileIdProvider.overrideWith((ref) => profileId)
            ],
            child: const ProfileScreen()
          );
        },
        routes: [
          GoRoute(
            path: 'edit',
            name: R.routes.editProfile,
            builder: (context, state) {
              return ProviderScope(
                overrides: [
                  currentlyEditedProfileProvider.overrideWith((ref) {
                    return state.extra as Profile;
                  })
                ],
                child: const EditProfileScreen(),
              );
            }
          )
        ]
      ),
      */
    ]
  );
});