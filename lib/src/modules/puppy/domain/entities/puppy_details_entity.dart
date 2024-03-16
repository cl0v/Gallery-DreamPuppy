import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pet_details.freezed.dart';
part 'pet_details.g.dart';

@freezed
class PuppyDetailsEntity with _$PuppyDetailsEntity {
  const factory PuppyDetailsEntity({
    required int id,
    required String breed,
    required int price,
    required bool pedigree,
    required int gender,
    required String birth,
    required bool microchip,
    int? weight,
    @JsonKey(name: 'minimum_age_departure_in_days')
    required int minimumAgeDepartureInDays,
    required List<String> images,
    // required List<Vermifuge> vermifuges,
    // required List<Vaccine> vaccines,
  }) = _PuppyDetailsEntity;

  factory PuppyDetailsEntity.fromJson(dynamic json) =>
      _$PuppyDetailsEntityFromJson(json);
}

@freezed
class Vermifuge with _$Vermifuge {
  const factory Vermifuge({
    required String brand,
    required String date,
  }) = _Vermifuge;

  factory Vermifuge.fromJson(dynamic json) => _$VermifugeFromJson(json);
}

@freezed
class Vaccine with _$Vaccine {
  const factory Vaccine({
    required String brand,
    required String type,
    required String date,
  }) = _Vaccine;

  factory Vaccine.fromJson(dynamic json) => _$VaccineFromJson(json);
}
