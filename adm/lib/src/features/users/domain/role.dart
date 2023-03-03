import 'package:freezed_annotation/freezed_annotation.dart';

enum Role {
  @JsonValue("admin") admin, 
  @JsonValue("super-admin") superAdmin, 
  @JsonValue("user") user
}

extension RoleExtensions on Role {
  String get name {
    switch (this) {
      case Role.admin:
        return "admin";
      case Role.superAdmin: 
        return "super-admin";
      case Role.user: 
        return "user";
    }
  }
}