import 'package:cat_breeds/lib.dart';

enum Environment {
  dev(),
  stg(),
  prod();

  static const baseUrl = String.fromEnvironment('baseUrl');
  static const apiKey = String.fromEnvironment('apiKey');
  static const enableLogging = bool.fromEnvironment('enableLogging');

  IConfig get config {
    switch (this) {
      case Environment.dev:
        return DevConfig();
      case Environment.stg:
        return StagingConfig();
      case Environment.prod:
        return ProdConfig();
    }
  }
}

abstract class IConfig {
  String get baseUrl;
  String get apiKey;
  bool get enableLogging;
}
