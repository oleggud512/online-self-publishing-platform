import 'package:client/src/common/log.dart';
import 'package:rxdart/subjects.dart';
import 'package:socket_io_client/socket_io_client.dart';


class SocketStream<StreamItemType> {
  Socket socket;
  String socketEvent;
  StreamItemType Function(dynamic data) parse;

  SocketStream({
    required this.socket, 
    required this.socketEvent, 
    required this.parse
  }) {
    setHandlers();
    socket.on("connect", (data) {
      printInfo('connected to ${socket.nsp}');
    });
    socket.on("disconnect", (data) {
      printInfo('disconnected from ${socket.nsp}');
    });
    socket.onReconnect((data) {
      printInfo('reconnect from ${socket.nsp}');
      setHandlers();
    });
  }

  void setHandlers() {
    printInfo('set handlers');
    socket.on(socketEvent, (data) {
      _controller.sink.add(parse(data));
    });
  }

  final _controller = BehaviorSubject<StreamItemType?>.seeded(null);

  Stream<StreamItemType?> get stream => _controller.stream;

  void dispose() {
    socket.dispose();
    _controller.close();
  }
}