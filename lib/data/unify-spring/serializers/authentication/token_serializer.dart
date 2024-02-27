import 'package:json_annotation/json_annotation.dart';
part 'token_serializer.g.dart';

@JsonSerializable()
class TokenResponse {
  TokenResponse({this.token});

  String? token;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}