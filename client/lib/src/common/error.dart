
class AppException implements Exception { }

class NotFoundException extends AppException { }

class ConnectionException extends AppException { 
  ConnectionException() {
    print("ConnectionException was thrown");
  }
}