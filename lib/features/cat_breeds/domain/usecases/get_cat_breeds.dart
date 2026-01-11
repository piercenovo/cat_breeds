import 'package:cat_breeds/lib.dart';

class GetCatBreeds {
  GetCatBreeds(this._repository);

  final CatBreedsRepository _repository;

  Future<List<CatBreed>> call() {
    return _repository.getBreeds();
  }
}
