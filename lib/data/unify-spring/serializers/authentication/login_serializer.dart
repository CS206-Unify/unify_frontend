import 'package:json_annotation/json_annotation.dart';
part 'login_serializer.g.dart';

@JsonSerializable()
class LoginRequest {
  LoginRequest({required this.username, required this.password});

  String username;
  String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
