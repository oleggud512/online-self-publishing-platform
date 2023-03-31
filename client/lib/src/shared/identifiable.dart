import '../features/profile/domain/profile.dart';

mixin Identifiable {
  String get id;
}

mixin Owned {
  Profile get author;
}