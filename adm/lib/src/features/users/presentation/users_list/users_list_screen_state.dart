import 'package:adm/src/features/users/domain/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_list_screen_state.freezed.dart';

@freezed
class UsersListScreenState with _$UsersListScreenState { 
  factory UsersListScreenState({
    @Default(AsyncData([])) AsyncValue<List<FireUser>> users,
  }) = _UsersListScreenState;
}