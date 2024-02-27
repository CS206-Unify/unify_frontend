import 'package:json_annotation/json_annotation.dart';
part 'registration_serializer.g.dart';

@JsonSerializable()
class RegisterRequest {
  RegisterRequest({required this.username, required this.email, required this.password});
  
  String username;
  String email;
  String password;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}