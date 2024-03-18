import 'package:json_annotation/json_annotation.dart';
part 'create_team_serializer.g.dart';

@JsonSerializable()
class CreateTeamRequest {
  CreateTeamRequest({required this.teamName, required this.region, required this.gameName, required this.language, required this.maximumTeamSize});
  
  String teamName;
  String region;
  String gameName;
  String language;
  int maximumTeamSize;

  factory CreateTeamRequest.fromJson(Map<String, dynamic> json) => _$CreateTeamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTeamRequestToJson(this);
}