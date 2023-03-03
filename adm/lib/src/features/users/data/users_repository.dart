import 'package:adm/src/shared/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user.dart';

class UsersRepository {
  UsersRepository(this.dio);

  final Dio dio;

  Future<List<FireUser>> fetchUsers() async {
    final response = await dio.get('users');
    print("UsersRepository.fetchUsers() - response.data = ${response.data}");
    final users = response.data['data'];
    return (users as List).map((s) => FireUser.fromJson(s)).toList();
  }

  Future<FireUser> updateUser(FireUser user) async {
    final response = await dio.patch('users/${user.uid}', data: user.toJson());
    print("UsersRepository.updateUser() type=${response.data.runtimeType} data=${response.data}");
    return FireUser.fromJson(response.data['data']);
  }
}

final usersRepositoryProvider = Provider((ref) {
  return UsersRepository(ref.watch(dioProvider));
});

final usersProvider = Provider.autoDispose((ref) {
  return ref.watch(usersRepositoryProvider).fetchUsers();
});