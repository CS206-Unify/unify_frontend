// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userprofile_serializer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileRequest _$UserProfileRequestFromJson(Map<String, dynamic> json) =>
    UserProfileRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserProfileRequestToJson(UserProfileRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
