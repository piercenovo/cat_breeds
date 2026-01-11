import 'package:cat_breeds_core/cat_breeds_core.dart';

typedef Json = Map<String, dynamic>;

typedef FutureEither<L, R> = Future<Either<L, R>>;
typedef FutureHttpRequest<R> = Future<Either<HttpRequestFailure, R>>;
