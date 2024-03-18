import 'package:json_annotation/json_annotation.dart';
part 'bsprofile_serializer.g.dart';

@JsonSerializable()
class BSProfileRequest {
  BSProfileRequest ({required this.region, required this.personalBio});

  String region;
  String personalBio;

  factory BSProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$BSProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BSProfileRequestToJson(this);
}
