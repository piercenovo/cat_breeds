import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_core/cat_breeds_core.dart';

class CatBreedsRepositoryImpl implements CatBreedsRepository {
  CatBreedsRepositoryImpl(this._remoteDatasource);
  final CatBreedsRemoteDatasource _remoteDatasource;

  @override
  Future<List<CatBreed>> getBreeds() async {
    final result = await _remoteDatasource.getBreeds();

    return result.when(
      left: (failure) {
        throw failure;
      },
      right: (dtos) {
        return dtos.map((e) => e.toEntity()).toList();
      },
    );
  }
}
