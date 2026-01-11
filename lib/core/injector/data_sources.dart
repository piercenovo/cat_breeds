import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_api/cat_breeds_api.dart';
import 'package:get_it/get_it.dart';

void injectDataSources({
  required IConfig config,
  required Http http,
}) {
  sl.registerLazySingleton<IConfig>(() => config);
}

class DataSources {
  DataSources._();
  static IConfig get config => GetIt.I.get();
}
