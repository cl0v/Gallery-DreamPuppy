// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kennel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KennelDetailsImpl _$$KennelDetailsImplFromJson(Map<String, dynamic> json) =>
    _$KennelDetailsImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      instagram: json['instagram'] as String,
      city: json['city'] as String,
      uf: json['uf'] as String,
    );

Map<String, dynamic> _$$KennelDetailsImplToJson(_$KennelDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'instagram': instance.instagram,
      'city': instance.city,
      'uf': instance.uf,
    };
