// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_team_serializer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTeamRequest _$CreateTeamRequestFromJson(Map<String, dynamic> json) =>
    CreateTeamRequest(
      teamName: json['teamName'] as String,
      region: json['region'] as String,
      gameName: json['gameName'] as String,
      language: json['language'] as String,
      maximumTeamSize: json['maximumTeamSize'] as int,
    );

Map<String, dynamic> _$CreateTeamRequestToJson(CreateTeamRequest instance) =>
    <String, dynamic>{
      'teamName': instance.teamName,
      'region': instance.region,
      'gameName': instance.gameName,
      'language': instance.language,
      'maximumTeamSize': instance.maximumTeamSize,
    };
