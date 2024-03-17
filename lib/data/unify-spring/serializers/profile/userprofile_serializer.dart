import 'package:json_annotation/json_annotation.dart';
part 'userprofile_serializer.g.dart';

@JsonSerializable()
class UserProfileRequest {
  UserProfileRequest({required this.username, required this.password});

  String username;
  String password;

  factory UserProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UserProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileRequestToJson(this);
}
