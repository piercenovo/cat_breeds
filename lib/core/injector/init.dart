import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_api/cat_breeds_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init(Environment environment) async {
  final config = environment.config;
  final enableLogging = config.enableLogging;
  final apiKey = config.apiKey;

  final dio = Dio(BaseOptions());
  dio.interceptors.addAll([
    RetryInterceptor(dio: dio, enableLogging: enableLogging),
    AuthInterceptor(apiKey: apiKey),
  ]);
  final http = Http(dio: dio, enableLogging: enableLogging);

  injectDataSources(config: config, http: http);
  injectRepositories();
  injectCubits();
}
