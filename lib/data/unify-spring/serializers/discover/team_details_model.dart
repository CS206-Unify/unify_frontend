import "package:unify/data/unify-spring/serializers/discover/team_member_model.dart";

class TeamDetails {
  final String id;
  final String? imageUrl;
  final String name;
  final String region;
  final DateTime teamCreationDate;
  final List<TeamMember> memberList;
  final int trophyRequirements;
  final int min3v3Wins;
  final int minDuoWins;
  final int minSoloWins;
  final int maxTeamSize;

  TeamDetails(
      {required this.id,
      this.imageUrl,
      required this.name,
      required this.region,
      required this.teamCreationDate,
      required this.memberList,
      required this.trophyRequirements,
      required this.min3v3Wins,
      required this.minDuoWins,
      required this.minSoloWins,
      required this.maxTeamSize});

  factory TeamDetails.fromMap(Map<String, dynamic> map) {
    return TeamDetails(
        id: map["_id"],
        imageUrl: map["imageString"],
        name: map["teamName"],
        region: map["region"],
        trophyRequirements: map["trophyRequirements"],
        min3v3Wins: map["min3v3Wins"],
        minDuoWins: map["minDuoWins"],
        minSoloWins: map["minSoloWins"],
        maxTeamSize: map["maximumTeamSize"],
        teamCreationDate: DateTime.parse(map["teamCreationDate"]),
        memberList: (map["memberList"] as List)
            .map((item) => TeamMember.fromMap(item as Map<String, dynamic>))
            .toList());
  }
}
