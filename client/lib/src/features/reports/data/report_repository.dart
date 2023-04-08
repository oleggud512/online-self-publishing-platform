import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/comments/domain/comment.dart';
import 'package:client/src/features/reports/domain/report_subject.dart';
import 'package:client/src/shared/err.dart';
import 'package:client/src/shared/identifiable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants.dart';
import '../../../shared/dio.dart';
import '../../profile/domain/profile.dart';
import '../domain/report_type.dart';

class ReportRepostiory {
  final Dio _dio;
  final String? _myId;

  ReportRepostiory(this._dio, this._myId);

  // subject - Book, Comment, Profile
  Future<bool> addReport<T extends Identifiable>(
    T subject,
    String reportType,
    String description
  ) => err(() async {
    String subjectName = ReportSubject.subjectNameFromObject(subject);
    String? defendant = ReportSubject.getDefendant(subject);
    final resp = await _dio.post(Str.dio.reports, data: {
      'subjectName': subjectName,
      'subject': subject.id,
      'reportType': reportType,
      'description': description,
      'author': _myId,
      'defendant': defendant
    });
    return resp.data[Str.dio.data] as bool;
  });

  Future<List<ReportType>> getReportTypes(String? subjectName) async {
    final resp = await _dio.get(Str.dio.reportTypes, queryParameters: { 
      'subjectName': subjectName 
    });
    return reportTypeListFromJson(resp.data[Str.dio.data]);
  }
}

final reportRepositoryProvider = Provider(
  (ref) => ReportRepostiory(ref.watch(dioProvider), ref.watch(myIdProvider)));