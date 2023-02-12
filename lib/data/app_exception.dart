class AppExeception implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;
  AppExeception(this._message, this._prefix);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExeception {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppExeception {
  BadRequestException([String? message]) : super(message, 'invalid request ');
}

class UnauthorisedException extends AppExeception {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorised request ');
}

class InvalidException extends AppExeception {
  InvalidException([String? message]) : super(message, 'Invalid Input');
}
