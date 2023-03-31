import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/comments/domain/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../profile/domain/profile.dart';

class ReportSubject {
  static const String book = "Book";
  static const String profile = "Profile";
  static const String comment = "Comment";

  static String subjectNameFromObject(dynamic subject) {
    if (subject is Book) { 
      return book;
    } else if (subject is Profile) {
      return profile;
    } else if (subject is Comment) {
      return comment;
    }
    throw 'incorrect object';
  }

  static String? getDefendant(dynamic subject) {
    final subjectName = subjectNameFromObject(subject);
    String? defendant;
    switch (subjectName) { 
      case ReportSubject.book:
        defendant = (subject as Book).author.id;
        break;
      case ReportSubject.profile:
        defendant = (subject as Profile).id;
        break;
      case ReportSubject.comment:
        defendant = (subject as Comment).author.id;
        break;
    }
    return defendant;
  }
}