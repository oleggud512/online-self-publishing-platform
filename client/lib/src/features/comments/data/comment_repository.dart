import 'package:client/src/common/log.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/comments/domain/comment.dart';
import 'package:client/src/shared/dio.dart';
import 'package:client/src/shared/err.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/widgets/error_handler.dart';

part 'comment_repository.g.dart';

class CantEditCommentException extends AppException { }

class CommentsSorting {
  static const String nnew = 'new';
  static const String old = 'old';
  static const String popular = 'popular';
}

class CommentRepository {
  final Dio _dio;
  final String? _myId;

  CommentRepository({required Dio dio, String? myId}) 
    : _dio = dio, 
      _myId = myId;

  Future<List<Comment>> getComments(
    String subjectId, 
    {
      String sorting = CommentsSorting.nnew,
      String? questionId,
      int from = 0,
      int pageSize = 20
    }
  ) => err(() async {
    printWarning("$subjectId, $sorting, $questionId, $from, $pageSize");
    final resp = await _dio.get('comments', queryParameters: {
      'from': from,
      'pageSize': pageSize,
      'sorting': sorting,
      'subjectId': subjectId,
      'questionId': questionId
    });
    printWarning(resp.data);
    final comments = commentListFromJson(resp.data['data']);
    for (final co in comments) {
      printWarning("${co.content} myRate = ${co.myRate}");
    }
    return comments;
  });

  Future<Comment> addComment({ 
    required String content, 
    required String subjectId,
    String? questionId
  }) => err(() async {
    if (content.isEmpty) throw "empty content";
    final resp = await _dio.post('comments', 
      queryParameters: {
        'subjectId': subjectId,
        if (questionId != null)'questionId': questionId
      },
      data: {
        'content': content
      }
    );
    return Comment.fromJson(resp.data['data']);
  });

  Future<int> rate(String commentId, CommentRate rate) => err(() async {
    final resp = await _dio.post('comments/$commentId/rate', queryParameters: {
      'rate': rate == CommentRate.like ? 1 : -1
    });
    return resp.data['data'] as int;
  });

  Future<Comment> updateComment(String commentId, String newContent) => err(() async {
    try {
      final resp = await _dio.put('comments/$commentId', 
        data: { 'content': newContent }
      );
      return Comment.fromJson(resp.data['data']);
    } on DioError catch (e) {
      if (e.response?.statusCode == 500 && e.response!.data['error']['code'] == 'cannotEditComment') {
        throw CantEditCommentException();
      }
      rethrow;
    }
  });

  Future<bool> deleteComment(String commentId) => err(() async {
    final resp = await _dio.delete('comments/$commentId');
    return resp.data['data'] as bool;
  });

  
}

@riverpod
CommentRepository commentRepository(CommentRepositoryRef ref) {
  return CommentRepository(dio: ref.watch(dioProvider), myId: ref.watch(myIdProvider));
}