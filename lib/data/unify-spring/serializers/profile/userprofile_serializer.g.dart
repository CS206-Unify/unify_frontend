// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userprofile_serializer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileRequest _$UserProfileRequestFromJson(Map<String, dynamic> json) =>
    UserProfileRequest(
      imageString: json['imageString'] as String,
      country: json['country'] as String,
      language: json['language'] as String,
    );

Map<String, dynamic> _$UserProfileRequestToJson(UserProfileRequest instance) =>
    <String, dynamic>{
      'imageString': instance.imageString,
      'country': instance.country,
      'language': instance.language,
    };
