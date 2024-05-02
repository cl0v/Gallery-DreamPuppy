// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_card_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GalleryCardEntity _$GalleryCardEntityFromJson(Map<String, dynamic> json) {
  return _GalleryCardEntity.fromJson(json);
}

/// @nodoc
mixin _$GalleryCardEntity {
  int get id => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryCardEntityCopyWith<GalleryCardEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryCardEntityCopyWith<$Res> {
  factory $GalleryCardEntityCopyWith(
          GalleryCardEntity value, $Res Function(GalleryCardEntity) then) =
      _$GalleryCardEntityCopyWithImpl<$Res, GalleryCardEntity>;
  @useResult
  $Res call({int id, String? uuid, String url});
}

/// @nodoc
class _$GalleryCardEntityCopyWithImpl<$Res, $Val extends GalleryCardEntity>
    implements $GalleryCardEntityCopyWith<$Res> {
  _$GalleryCardEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = freezed,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryCardEntityImplCopyWith<$Res>
    implements $GalleryCardEntityCopyWith<$Res> {
  factory _$$GalleryCardEntityImplCopyWith(_$GalleryCardEntityImpl value,
          $Res Function(_$GalleryCardEntityImpl) then) =
      __$$GalleryCardEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? uuid, String url});
}

/// @nodoc
class __$$GalleryCardEntityImplCopyWithImpl<$Res>
    extends _$GalleryCardEntityCopyWithImpl<$Res, _$GalleryCardEntityImpl>
    implements _$$GalleryCardEntityImplCopyWith<$Res> {
  __$$GalleryCardEntityImplCopyWithImpl(_$GalleryCardEntityImpl _value,
      $Res Function(_$GalleryCardEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = freezed,
    Object? url = null,
  }) {
    return _then(_$GalleryCardEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GalleryCardEntityImpl
    with DiagnosticableTreeMixin
    implements _GalleryCardEntity {
  const _$GalleryCardEntityImpl(
      {required this.id, this.uuid, required this.url});

  factory _$GalleryCardEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$GalleryCardEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String? uuid;
  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GalleryCardEntity(id: $id, uuid: $uuid, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GalleryCardEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryCardEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uuid, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryCardEntityImplCopyWith<_$GalleryCardEntityImpl> get copyWith =>
      __$$GalleryCardEntityImplCopyWithImpl<_$GalleryCardEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GalleryCardEntityImplToJson(
      this,
    );
  }
}

abstract class _GalleryCardEntity implements GalleryCardEntity {
  const factory _GalleryCardEntity(
      {required final int id,
      final String? uuid,
      required final String url}) = _$GalleryCardEntityImpl;

  factory _GalleryCardEntity.fromJson(Map<String, dynamic> json) =
      _$GalleryCardEntityImpl.fromJson;

  @override
  int get id;
  @override
  String? get uuid;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$GalleryCardEntityImplCopyWith<_$GalleryCardEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
