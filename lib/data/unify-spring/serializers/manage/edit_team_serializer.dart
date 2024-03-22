import 'package:json_annotation/json_annotation.dart';
part 'edit_team_serializer.g.dart';

@JsonSerializable()
class EditTeamRequest {
  EditTeamRequest({
    required this.teamName,
    required this.region,
    required this.maximumTeamSize,
    required this.imageString,
    required this.trophyRequirements,
    required this.min3v3Wins,
    required this.minDuoWins,
    required this.minSoloWins,
  });

  String teamName;
  String region;
  int maximumTeamSize;
  String? imageString;
  int trophyRequirements;
  int min3v3Wins;
  int minDuoWins;
  int minSoloWins;

  factory EditTeamRequest.fromJson(Map<String, dynamic> json) =>
      _$EditTeamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditTeamRequestToJson(this);
}
