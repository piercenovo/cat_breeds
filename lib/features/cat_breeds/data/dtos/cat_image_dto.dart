import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_image_dto.freezed.dart';
part 'cat_image_dto.g.dart';

@freezed
abstract class CatImageDto with _$CatImageDto {
  const factory CatImageDto({
    required String id,
    required String url,
    required int width,
    required int height,
  }) = _CatImageDto;

  factory CatImageDto.fromJson(Map<String, dynamic> json) =>
      _$CatImageDtoFromJson(json);
}
