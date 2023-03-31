import 'dart:async';

import 'package:client/src/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/subjects.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../common/log.dart';
import '../features/messages/domain/message.dart';

Socket socket({String? namespace, Map<dynamic, dynamic>? queryParams}) {
  var options = OptionBuilder()
    .setTransports([ 'websocket' ]);
  
  options = options.setAuthFn((authFn) async {
    if (FirebaseAuth.instance.currentUser == null) return authFn({});
    return authFn({
      "authorization": "Bearer ${await FirebaseAuth.instance.currentUser!.getIdToken()}"
    });
  });
  
  if (queryParams != null) options = options.setQuery(queryParams);

  return io("$baseSocketUrl${namespace ?? ""}", options.build());
}


class IncomingEvents {
  static const String nextMessage = 'nextMessage';
}


class OutcomingEvents {
  static const String subscribeAllMessages = "subscribeAllMessages";
  static const String unsubscribeAllMessages = "unsubscribeAllMessages";
}


class NextMessageHandler {
  NextMessageHandler(this.callback, [this.reportId]) {
    chatsSocket.emit(OutcomingEvents.subscribeAllMessages, reportId);
    chatsSocket.on(IncomingEvents.nextMessage, _listener);
  }

  final String? reportId;

  final void Function(Message nextMessage) callback;

  final chatsSocket = socket(namespace: 'chats');
  final _subject = PublishSubject<Message>();

  Future<void> dispose() async {
    await _subject.close();
    chatsSocket.off(IncomingEvents.nextMessage, _listener);
    chatsSocket.emit(OutcomingEvents.unsubscribeAllMessages, reportId);
    chatsSocket.dispose();
  }

  void _listener(dynamic data) {
    Message message = Message.fromJson(data);
    printInfo('NextMessageHandler._listener');
    callback(message);
  }
  
}