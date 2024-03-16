// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kennel_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KennelDetails _$KennelDetailsFromJson(Map<String, dynamic> json) {
  return _KennelDetails.fromJson(json);
}

/// @nodoc
mixin _$KennelDetails {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get instagram => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get uf => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KennelDetailsCopyWith<KennelDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KennelDetailsCopyWith<$Res> {
  factory $KennelDetailsCopyWith(
          KennelDetails value, $Res Function(KennelDetails) then) =
      _$KennelDetailsCopyWithImpl<$Res, KennelDetails>;
  @useResult
  $Res call(
      {int id,
      String name,
      String phone,
      String instagram,
      String city,
      String uf});
}

/// @nodoc
class _$KennelDetailsCopyWithImpl<$Res, $Val extends KennelDetails>
    implements $KennelDetailsCopyWith<$Res> {
  _$KennelDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? instagram = null,
    Object? city = null,
    Object? uf = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      instagram: null == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      uf: null == uf
          ? _value.uf
          : uf // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KennelDetailsImplCopyWith<$Res>
    implements $KennelDetailsCopyWith<$Res> {
  factory _$$KennelDetailsImplCopyWith(
          _$KennelDetailsImpl value, $Res Function(_$KennelDetailsImpl) then) =
      __$$KennelDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String phone,
      String instagram,
      String city,
      String uf});
}

/// @nodoc
class __$$KennelDetailsImplCopyWithImpl<$Res>
    extends _$KennelDetailsCopyWithImpl<$Res, _$KennelDetailsImpl>
    implements _$$KennelDetailsImplCopyWith<$Res> {
  __$$KennelDetailsImplCopyWithImpl(
      _$KennelDetailsImpl _value, $Res Function(_$KennelDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? instagram = null,
    Object? city = null,
    Object? uf = null,
  }) {
    return _then(_$KennelDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      instagram: null == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      uf: null == uf
          ? _value.uf
          : uf // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KennelDetailsImpl implements _KennelDetails {
  const _$KennelDetailsImpl(
      {required this.id,
      required this.name,
      required this.phone,
      required this.instagram,
      required this.city,
      required this.uf});

  factory _$KennelDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$KennelDetailsImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String instagram;
  @override
  final String city;
  @override
  final String uf;

  @override
  String toString() {
    return 'KennelDetails(id: $id, name: $name, phone: $phone, instagram: $instagram, city: $city, uf: $uf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KennelDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.uf, uf) || other.uf == uf));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, phone, instagram, city, uf);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KennelDetailsImplCopyWith<_$KennelDetailsImpl> get copyWith =>
      __$$KennelDetailsImplCopyWithImpl<_$KennelDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KennelDetailsImplToJson(
      this,
    );
  }
}

abstract class _KennelDetails implements KennelDetails {
  const factory _KennelDetails(
      {required final int id,
      required final String name,
      required final String phone,
      required final String instagram,
      required final String city,
      required final String uf}) = _$KennelDetailsImpl;

  factory _KennelDetails.fromJson(Map<String, dynamic> json) =
      _$KennelDetailsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get instagram;
  @override
  String get city;
  @override
  String get uf;
  @override
  @JsonKey(ignore: true)
  _$$KennelDetailsImplCopyWith<_$KennelDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
