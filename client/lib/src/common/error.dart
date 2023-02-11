
import 'package:client/src/common/log.dart';

class AppException implements Exception { }

class NotFoundException extends AppException { }

class ConnectionException extends AppException { 
  ConnectionException() {
    printInfo("I am the ConnectionException!");
  }
}