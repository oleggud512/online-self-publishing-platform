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
  profile,
    editProfile,
    profileBooks,
    subscribers,
    subscriptions,
  chapter,
  editChapter
}

class Prefs {
  static const String currentLocale = 'currentLocale';
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