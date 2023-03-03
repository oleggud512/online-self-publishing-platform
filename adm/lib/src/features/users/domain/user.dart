import 'package:adm/src/features/users/domain/role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/serialization.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class FireUser with _$FireUser {
  factory FireUser({
    String? displayName,
    String? email,
    required String uid,
    required Role role
  }) = _FireUser;

  factory FireUser.fromJson(Map<String, dynamic> json) => _$FireUserFromJson(json);
}

extension FireUserExt on FireUser {
  bool get isSuper => role == Role.superAdmin;
}