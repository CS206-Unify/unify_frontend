// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_team_serializer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditTeamRequest _$EditTeamRequestFromJson(Map<String, dynamic> json) =>
    EditTeamRequest(
      teamName: json['teamName'] as String,
      region: json['region'] as String,
      maximumTeamSize: json['maximumTeamSize'] as int,
      imageString: json['imageString'] as String?,
      trophyRequirements: json['trophyRequirements'] as int,
      min3v3Wins: json['min3v3Wins'] as int,
      minDuoWins: json['minDuoWins'] as int,
      minSoloWins: json['minSoloWins'] as int,
    );

Map<String, dynamic> _$EditTeamRequestToJson(EditTeamRequest instance) =>
    <String, dynamic>{
      'teamName': instance.teamName,
      'region': instance.region,
      'maximumTeamSize': instance.maximumTeamSize,
      'imageString': instance.imageString,
      'trophyRequirements': instance.trophyRequirements,
      'min3v3Wins': instance.min3v3Wins,
      'minDuoWins': instance.minDuoWins,
      'minSoloWins': instance.minSoloWins,
    };
