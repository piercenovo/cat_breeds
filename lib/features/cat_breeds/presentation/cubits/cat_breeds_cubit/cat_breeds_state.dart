part of 'cat_breeds_cubit.dart';

@freezed
class CatBreedsState with _$CatBreedsState {
  const factory CatBreedsState.initial() = _Initial;
  const factory CatBreedsState.loading() = _Loading;
  const factory CatBreedsState.success({required List<CatBreed> breeds}) =
      _Success;
  const factory CatBreedsState.error({required HttpRequestFailure failure}) =
      _Error;
}
