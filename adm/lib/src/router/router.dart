import 'package:adm/src/features/authentication/data/auth_repository.dart';
import 'package:adm/src/features/authentication/presentation/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/users/presentation/user/user_screen.dart';
import '../features/users/presentation/users_list/users_list_screen.dart';
import 'go_router_refresh_stream.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/auth',
    refreshListenable: GoRouterRefreshStream(authRepo.authStateChanges),
    redirect: (context, state) { 
      final isLoggedIn = authRepo.currentUser != null;
      print("redirect isLoggedIn = $isLoggedIn");
      if (isLoggedIn && state.location == '/auth') {
        print('redirect to /users');
        return '/users';
      } else if (!isLoggedIn && state.location != '/auth') {
        print('redirect to /auth');
        return '/auth';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'init',
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text("some init page")
          ), 
          body: const Center(
            child: CircularProgressIndicator()
          )
        )
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) => AuthScreen(),
      ),
      GoRoute(
        path: '/users',
        name: 'users',
        builder: (context, state) => const UsersListScreen(),
        routes: [
          GoRoute(
            path: ':id',
            name: 'user',
            builder: (context, state) => UserScreen(id: state.queryParams['id']!)
          )
        ]
      )
    ]
  );
});