import 'package:json_annotation/json_annotation.dart';
part 'userprofile_serializer.g.dart';

@JsonSerializable()
class UserProfileRequest {
  UserProfileRequest(
      {required this.imageString,
      required this.country,
      required this.language});

  String imageString;
  String country;
  String language;

  factory UserProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UserProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileRequestToJson(this);
}
