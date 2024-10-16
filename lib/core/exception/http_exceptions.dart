class HttpException implements Exception {
  final String message;
  final int statusCode;

  HttpException(this.message, this.statusCode);

  @override
  String toString() => 'HttpException: $message (Status Code: $statusCode)';
}

class BadRequestException extends HttpException {
  BadRequestException(String message) : super(message, 400);
}

class UnauthorizedException extends HttpException {
  UnauthorizedException(String message) : super(message, 401);
}

class ForbiddenException extends HttpException {
  ForbiddenException(String message) : super(message, 403);
}

class NotFoundException extends HttpException {
  NotFoundException(String message) : super(message, 404);
}

class InternalServerErrorException extends HttpException {
  InternalServerErrorException(String message) : super(message, 500);
}

HttpException handleHttpError(int statusCode) {
  switch (statusCode) {
    case 400:
      return BadRequestException('Bad request.');
    case 401:
      return UnauthorizedException('Unauthorized access.');
    case 403:
      return ForbiddenException('Forbidden request.');
    case 404:
      return NotFoundException('Resource not found.');
    case 500:
      return InternalServerErrorException('Internal server error.');
    default:
      return HttpException('Unexpected error occurred.', statusCode);
  }
}
