import 'package:json_annotation/json_annotation.dart';
part 'common_error_serializer.g.dart';

@JsonSerializable()
class CommonError {
  CommonError(
      {this.timestamp, this.error, this.status, this.message, this.path});

  String? timestamp;
  String? error;
  int? status;
  String? message;
  String? path;

  factory CommonError.fromJson(Map<String, dynamic> json) =>
      _$CommonErrorFromJson(json);

  Map<String, dynamic> toJson() => _$CommonErrorToJson(this);
}
