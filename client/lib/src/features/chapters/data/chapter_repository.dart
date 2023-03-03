import 'package:client/src/common/log.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:client/src/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/dio.dart';

class ChapterRepository {
  final Dio _dio;
  final String? _myId;

  ChapterRepository(this._dio, this._myId);

  Future<List<Chapter>> getChapters(
    String bookId, 
    [
      int from = 0, 
      int pageSize = 20
    ]
  ) async {
    final resp = await _dio.get(Str.dio.chapters, queryParameters: {
      Str.dio.bookId: bookId,
      Str.dio.from: from,
      Str.dio.pageSize: pageSize
    });
    return chapterListFromJson(resp.data[Str.dio.data]);
  }

  Future<Chapter> getChapter(String chapterId) async {
    final resp = await _dio.get(Str.dio.chapter(chapterId));
    final chapter = Chapter.fromJson(resp.data[Str.dio.data]);
    return chapter;
  }

  Future<bool> deleteChapter(String chapterId) async {
    final resp = await _dio.delete(Str.dio.chapter(chapterId));
    return resp.data[Str.dio.data] as bool;
  }

  Future<Chapter> updateChapter(Chapter newChapter) async {
    printWarning(newChapter.toJson());
    final resp = await _dio.put(Str.dio.chapter(newChapter.id), data: newChapter.toJson());
    final chapter = Chapter.fromJson(resp.data[Str.dio.data]);
    return chapter;
  }
  
  Future<Chapter> addChapter(Chapter newChapter) async {
    final resp = await _dio.post(Str.dio.chapters, data: newChapter.toJson());
    final createdChapter = Chapter.fromJson(resp.data[Str.dio.data]);
    return createdChapter;
  }

  Future<ReadingsState> toggleState(String chapterId) async {
    final resp = await _dio.post(Str.dio.chapterState(chapterId));
    return readingsStateFromString(resp.data[Str.dio.data]);
  }
}

final chapterRepositoryProvider = Provider((ref) {
  return ChapterRepository(ref.watch(dioProvider), ref.watch(myIdProvider));
});