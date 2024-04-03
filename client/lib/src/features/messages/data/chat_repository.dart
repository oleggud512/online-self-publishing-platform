import 'package:client/src/common/log.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/messages/domain/chat.dart';
import 'package:client/src/features/messages/domain/message.dart';
import 'package:client/src/shared/constants.dart';
import 'package:client/src/shared/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatRepository {
  final Dio _dio;
  final String? _myId;

  ChatRepository(this._dio, this._myId);

  Future<List<Message>> getMessages(
    String otherId, 
    [
      int? from, 
      int? pageSize
    ]
  ) async {
    final resp = await _dio.get('chats/$otherId', queryParameters: {
      'from': from,
      'pageSize': pageSize
    }); 
    return messageListFromJson(resp.data['data']);
  }

  Future<List<Chat>> getChats([int? from, int? pageSize]) async {
    final resp = await _dio.get('chats', queryParameters: {
      'from': from,
      'pageSize': pageSize
    }); 
    return chatListFromJson(resp.data['data']);
  }

  Future<void> addMessage(String to, String content) async {
    _dio.post('chats', data: { 
      'from': _myId,
      'to': to,
      'content': content 
    });
  }

  Future<List<Chat>> getAdminChats([int? from, int? pageSize]) async {
    final resp = await _dio.get("reports/chats", queryParameters: {
      'from': from,
      'pageSize': pageSize
    });
    printInfo(resp.data);
    return List<dynamic>.from(resp.data[Str.dio.data]).map((c) {
      final chat = Chat.fromJson(c);
      return chat.copyWith(source: ChatSource.admin);
    }).toList();
    // return chatListFromJson(resp.data[Str.dio.data]);
  }

  Future<List<Message>> getAdminMessages(String reportId, [int? from, int? pageSize]) async {
    final resp = await _dio.get("reports/$reportId/messages", queryParameters: {
      'from': from,
      'pageSize': pageSize
    });
    return messageListFromJson(resp.data[Str.dio.data]);
  }

  Future<void> addAdminMessage(String reportId, String content) async {
    final resp = await _dio.post("reports/$reportId/messages", data: { 'content': content });
    // return Message.fromJson(resp.data);
  }
}


final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(ref.watch(dioProvider), ref.watch(myIdProvider))
);