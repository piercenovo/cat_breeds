import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_api/cat_breeds_api.dart';
import 'package:cat_breeds_core/cat_breeds_core.dart';

abstract class CatBreedsRemoteDatasource {
  FutureHttpRequest<List<CatBreedDto>> getBreeds();
}

class CatBreedsRemoteDatasourceImpl implements CatBreedsRemoteDatasource {
  CatBreedsRemoteDatasourceImpl({required Http http}) : _http = http;

  final Http _http;

  @override
  FutureHttpRequest<List<CatBreedDto>> getBreeds() {
    return performHttpRequest(
      _http.send(
        APIPaths.breeds,
        parser: (_, json) {
          final list = json as List<dynamic>;
          return list
              .map(
                (e) => CatBreedDto.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
        },
      ),
    );
  }
}
