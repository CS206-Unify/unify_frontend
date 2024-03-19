// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bsprofile_serializer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BSProfileRequest _$BSProfileRequestFromJson(Map<String, dynamic> json) =>
    BSProfileRequest(
      region: json['region'] as String?,
      personalBio: json['personalBio'] as String?,
    );

Map<String, dynamic> _$BSProfileRequestToJson(BSProfileRequest instance) =>
    <String, dynamic>{
      'region': instance.region,
      'personalBio': instance.personalBio,
    };
