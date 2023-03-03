import 'package:adm/src/common/hardcoded.dart';
import 'package:adm/src/constants/sizes.dart';
import 'package:adm/src/features/authentication/data/auth_repository.dart';
import 'package:adm/src/features/users/domain/role.dart';
import 'package:adm/src/features/users/domain/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'users_list_screen_controller.dart';

class UsersListScreen extends ConsumerWidget {
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(usersListScreenControllerProvider);
    final currentUser = ref.watch(currentUserProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Users".hardcoded), 
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.arrowRightFromBracket),
            onPressed: () => ref.watch(authRepositoryProvider).signOut()
          ),
        ]
      ),
      body: state.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              FireUser user = data[index];
              return Card(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(user.email ?? "no email"),
                        Text(user.role.name),
                        Text(user.uid),
                      ]
                    ),
                    const Spacer(),
                    // 1 - когда грузится - disabled
                    // 2 - если загрузился - проверяем на супер админа - супер - тогда можно. 
                    Column(
                      children: [
                        currentUser.when(
                          data: (curUser) {
                            if (curUser == null) return shrink;
                            if (curUser.role != Role.superAdmin) return shrink;
                            return DropdownButton<Role>( 
                              value: user.role,
                              items: Role.values.map(
                                (r) => DropdownMenuItem(value: r, child: Text(r.name))
                              ).toList(),
                              onChanged: (newRole) {
                                print("i set a new role for the user ${user.uid} - this is ${newRole?.name}");
                                ref.watch(usersListScreenControllerProvider.notifier)
                                  .udpateUserRole(user, newRole!);
                              }
                            );
                          },
                          loading: () => shrink,
                          error: (er, st) => shrink
                        )
                      ]
                    )
                  ]
                )
              );
            }
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) =>  SingleChildScrollView(child: SelectableText("$e\n$st"))
      )
    );
  }
}