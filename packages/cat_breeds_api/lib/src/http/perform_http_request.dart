import 'dart:io';

import 'package:cat_breeds_api/cat_breeds_api.dart';
import 'package:cat_breeds_core/cat_breeds_core.dart';

final _network = HttpRequestFailure.network();
final _unauthorized = HttpRequestFailure.unauthorized();
final _internalServer = HttpRequestFailure.internalServer();
final _serviceUnavailable = HttpRequestFailure.serviceUnavailable();
final _forbidden = HttpRequestFailure.forbidden();
final _notFound = HttpRequestFailure.notFound();
final _unhandledException = HttpRequestFailure.unhandledException();

FutureHttpRequest<T> performHttpRequest<T>(Future<HttpResult<T>> future) async {
  final result = await future;
  return switch (result) {
    HttpSuccess(statusCode: _, data: final data) => Either.right(data),
    HttpFailed(statusCode: _, error: final err) when err is SocketException =>
      Either.left(_network),
    HttpFailed(statusCode: final statusCode) => switch (statusCode) {
      HttpStatus.unauthorized => Either.left(_unauthorized),
      HttpStatus.forbidden => Either.left(_forbidden),
      HttpStatus.notFound => Either.left(_notFound),
      HttpStatus.internalServerError => Either.left(_internalServer),
      HttpStatus.serviceUnavailable => Either.left(_serviceUnavailable),
      _ => Either.left(_unhandledException),
    },
  };
}
