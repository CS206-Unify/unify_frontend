// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_error_serializer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonError _$CommonErrorFromJson(Map<String, dynamic> json) => CommonError(
      timestamp: json['timestamp'] as String?,
      error: json['error'] as String?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$CommonErrorToJson(CommonError instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'error': instance.error,
      'status': instance.status,
      'message': instance.message,
      'path': instance.path,
    };
