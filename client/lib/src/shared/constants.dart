// const baseUrl = "http://127.0.0.1:3000/";
// final baseUrl = "http://10.0.2.2:3000/";
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

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
    bookFilters,
  // authors,
  profiles,
  myProfile,

  settings,
  notifications,
  bookmarks,

  chat,
  book,
    editBook,
    addBook,
    chapters,
      chapter,
        editChapter,
      addChapter,
  profile,
    editProfile,
    profileBooks,
    subscribers,
    subscriptions,
  blocked,
  popularBooks,
  popularAuthors
}

class Str {
  static const String currentLocale = 'currentLocale';
  static final dio = _DioRouters();
  static const String notificationType = 'notificationType';
  static const String sentTime = 'sentTime';
}

class _DioRouters {
  final String books = 'books';
  final String chapters = 'chapters';
  final String profiles = 'profiles';
  final String bookId = "bookId";
  final String from = 'from';
  final String state = 'state';
  final String pageSize = 'pageSize';
  final String data = 'data';
  final String reports = 'reports';
  final String reportTypes = 'reports/types';

  final String email = "email";
  final String password = "password";

  final String passwordAuth = 'auth/password';
  final String googleAuth = 'auth/google';

  String get popularBooks => '$books/popular';
  String get popularAuthors => '$profiles/popular';

  final String idToken = "idToken";
  final String accessToken = "accessToken";
  final String customToken = "customToken";

  String chapter(String chapterId) {
    return "$chapters/$chapterId";
  }
  String chapterState(String chapterId) {
    return "${chapter(chapterId)}/$state";
  }
  String chapterNav(String chapterId) {
    return "${chapter(chapterId)}/nav";
  }
}

class AppColors {
  static teritary(BuildContext context) =>
    Theme.of(context).colorScheme.tertiary;

  static const Color completed = Color(0xFFA69F3D);
  static const Color abandoned = Color(0xFF878676);
  static inProgress(BuildContext context) => teritary(context);

  static published(BuildContext context) => teritary(context);
  static const Color unpublished = Color(0xFF7F7571);
  
}

class Constants {
  static final dateFormat = DateFormat("dd/MM/yy HH:mm");  
  static const placeholderIconSize = 96.0;
}
