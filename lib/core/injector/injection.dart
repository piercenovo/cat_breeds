// ignore_for_file: cascade_invocations

import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_api/cat_breeds_api.dart';

void setupDependencies({
  required IConfig config,
  required Http http,
}) {
  sl.registerLazySingleton<IConfig>(() => config);
  sl.registerLazySingleton<Http>(() => http);
  sl.registerLazySingleton<CatBreedsRemoteDatasource>(
    () => CatBreedsRemoteDatasourceImpl(http: sl()),
  );
  sl.registerLazySingleton<CatBreedsRepository>(
    () => CatBreedsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetCatBreeds(sl()));
  sl.registerFactory(() => CatBreedsCubit(sl()));
}
