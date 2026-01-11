import 'package:cat_breeds/lib.dart';

abstract class CatBreedsRepository {
  Future<List<CatBreed>> getBreeds();
}
