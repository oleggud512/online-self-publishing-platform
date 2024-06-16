class AppError {
  String code;

  AppError(this.code);
}

class BlockedAppError extends AppError {
  BlockedAppError(super.code);
}
