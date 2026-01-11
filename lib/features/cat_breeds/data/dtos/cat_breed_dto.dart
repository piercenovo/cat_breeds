import 'package:cat_breeds/lib.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_breed_dto.freezed.dart';
part 'cat_breed_dto.g.dart';

@freezed
abstract class CatBreedDto with _$CatBreedDto {
  const factory CatBreedDto({
    required String id,
    required String name,
    required String description,
    required String origin,
    required String temperament,
    @JsonKey(name: 'life_span') required String lifeSpan,
    CatImageDto? image,
  }) = _CatBreedDto;

  factory CatBreedDto.fromJson(Map<String, dynamic> json) =>
      _$CatBreedDtoFromJson(json);
}
