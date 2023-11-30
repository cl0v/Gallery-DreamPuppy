// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PuppyDetailsEntityImpl _$$PuppyDetailsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PuppyDetailsEntityImpl(
      id: json['id'] as int,
      breed: json['breed'] as String,
      price: json['price'] as int,
      pedigree: json['pedigree'] as bool,
      gender: json['gender'] as int,
      birth: json['birth'] as String,
      microchip: json['microchip'] as bool,
      minimumAgeDepartureInDays: json['minimum_age_departure_in_days'] as int,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      vermifuges: (json['vermifuges'] as List<dynamic>)
          .map(Vermifuge.fromJson)
          .toList(),
      vaccines:
          (json['vaccines'] as List<dynamic>).map(Vaccine.fromJson).toList(),
    );

Map<String, dynamic> _$$PuppyDetailsEntityImplToJson(
        _$PuppyDetailsEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'breed': instance.breed,
      'price': instance.price,
      'pedigree': instance.pedigree,
      'gender': instance.gender,
      'birth': instance.birth,
      'microchip': instance.microchip,
      'minimum_age_departure_in_days': instance.minimumAgeDepartureInDays,
      'images': instance.images,
      'vermifuges': instance.vermifuges,
      'vaccines': instance.vaccines,
    };

_$VermifugeImpl _$$VermifugeImplFromJson(Map<String, dynamic> json) =>
    _$VermifugeImpl(
      brand: json['brand'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$VermifugeImplToJson(_$VermifugeImpl instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'date': instance.date,
    };

_$VaccineImpl _$$VaccineImplFromJson(Map<String, dynamic> json) =>
    _$VaccineImpl(
      brand: json['brand'] as String,
      type: json['type'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$VaccineImplToJson(_$VaccineImpl instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'type': instance.type,
      'date': instance.date,
    };
