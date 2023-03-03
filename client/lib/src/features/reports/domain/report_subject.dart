import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/comments/domain/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../profile/domain/profile.dart';

class ReportSubject {
  static const String book = "Book";
  static const String profile = "Profile";
  static const String comment = "Comment";

  static String fromObject(dynamic object) {
    if (object is Book) { 
      return book;
    } else if (object is Profile) {
      return profile;
    } else if (object is Comment) {
      return comment;
    }
    throw 'incorrect object';
  }
}