// const baseUrl = "http://127.0.0.1:3000/";
// final baseUrl = "http://10.0.2.2:3000/";
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Envs {
  static const String baseUrl = 'BASE_URL';
}

final baseUrl = dotenv.env[Envs.baseUrl];
final baseApiUrl = "${baseUrl}api/v1/";
final baseSocketUrl = baseUrl;

enum MyRoute {
  root,
  auth,

  home,
  chats,
  books,
  // authors,
  profiles,
  myProfile,

  settings,
  notifications,
  chat,
  editBook,
  profile,
  editProfile,

  subscribers,
  subscriptions,

  chapter,
  editChapter
}

class Prefs {
  static const String currentLocale = 'currentLocale';
}