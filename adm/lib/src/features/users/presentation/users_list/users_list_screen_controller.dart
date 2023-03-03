import 'dart:async';

import 'package:adm/src/features/users/data/users_repository.dart';
import 'package:adm/src/features/users/domain/role.dart';
import 'package:adm/src/features/users/presentation/users_list/users_list_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/user.dart';

part 'users_list_screen_controller.g.dart';

@riverpod
class UsersListScreenController extends _$UsersListScreenController {
  
  Future<void> udpateUserRole(FireUser user, Role newRole) async {
    FireUser newUser = user.copyWith(role: newRole);
    state = await AsyncValue.guard(() async {
      await ref.watch(usersRepositoryProvider).updateUser(newUser);
      return ref.watch(usersRepositoryProvider).fetchUsers();
    });
  }
  
  @override
  FutureOr<List<FireUser>> build() {
    return ref.watch(usersRepositoryProvider).fetchUsers();
  }
}
