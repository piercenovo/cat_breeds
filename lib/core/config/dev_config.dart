import 'package:cat_breeds/lib.dart';

class DevConfig implements IConfig {
  @override
  String get baseUrl => Environment.baseUrl;

  @override
  String get apiKey => Environment.apiKey;

  @override
  bool get enableLogging => Environment.enableLogging;
}
