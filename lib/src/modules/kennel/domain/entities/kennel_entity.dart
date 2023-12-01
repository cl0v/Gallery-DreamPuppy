import 'package:freezed_annotation/freezed_annotation.dart';

part 'kennel_entity.freezed.dart';
part 'kennel_entity.g.dart';

@freezed
class KennelDetails with _$KennelDetails {
  const factory KennelDetails({
    required int id,
    required String name,
    required String phone,
    required String instagram,
    required String city,
    required String uf,
  }) = _KennelDetails;

  factory KennelDetails.fromJson(dynamic json) => _$KennelDetailsFromJson(json);
}
