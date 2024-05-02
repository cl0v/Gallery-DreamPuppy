import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'gallery_card_entity.freezed.dart';
part 'gallery_card_entity.g.dart';

@freezed
class GalleryCardEntity with _$GalleryCardEntity {
  const factory GalleryCardEntity({
    required int id,
    String? uuid,
    required String url,
  }) = _GalleryCardEntity;

  factory GalleryCardEntity.fromJson(dynamic json) =>
      _$GalleryCardEntityFromJson(json);
}
