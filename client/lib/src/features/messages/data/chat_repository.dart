import 'package:client/src/common/log.dart';
import 'package:client/src/common/socket_stream.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/messages/domain/chat.dart';
import 'package:client/src/features/messages/domain/message.dart';
import 'package:client/src/shared/dio.dart';
import 'package:client/src/shared/socket.dart';
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

  SocketStream<Message?> watchAllMessages() {
    printInfo("Stream<Message?> watchAllMessages() {");
    return SocketStream<Message?>(
      socket: socket(namespace: 'chats'), 
      socketEvent: "nextMessage", 
      parse: (data) {
        try {
          printWarning(data);
          return Message.fromJson(data);
        } catch (e) {
          printError(e);
          return null;
        }
      }
    );
  }

  SocketStream<Message?> watchChatMessage(String otherId) {
    printInfo("Stream<Message?> watchChatMessage(String otherId) {");
    return SocketStream<Message?>(
      socket: socket(namespace: 'chat', queryParams: { 'other': otherId }), 
      socketEvent: "nextMessage", 
      parse: (data) {
        try {
          printWarning(data);
          return Message.fromJson(data);
        } catch (e) {
          printError(e);
          return null;
        }
      }
    );
  }
}


final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(ref.watch(dioProvider), ref.watch(myIdProvider))
);