import 'package:adm/src/features/users/domain/role.dart';

class Serialization {
  static Role roleFromString(Map<dynamic, dynamic> json, String key) {
    switch (json[key] as String?) {
      case "admin":
        return Role.admin;
      case "super-admin":
        return Role.superAdmin;
      case "user": 
        return Role.user;
      default:
        return Role.user;
    }
  }
}