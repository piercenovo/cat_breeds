import 'package:cat_breeds/lib.dart';

extension CatBreedDtoMapper on CatBreedDto {
  CatBreed toEntity() => CatBreed(
    id: id,
    name: name,
    description: description,
    origin: origin ?? '',
    temperament: temperament,
    lifeSpan: lifeSpan,
    imageUrl: image?.url ?? '',
  );
}
