import 'package:client/src/shared/logger.dart';

class AppException implements Exception { }

class NotFoundException extends AppException { }

class UnauthenticatedException extends AppException { }

class ConnectionException extends AppException { 
  ConnectionException() {
    glogger.t("I am ConnectionException!");
  }
}
