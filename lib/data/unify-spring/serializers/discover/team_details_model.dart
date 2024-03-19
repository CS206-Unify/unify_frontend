import "package:unify/data/unify-spring/serializers/discover/team_member_model.dart";

class TeamDetails {
  final String id;
  final String? imageUrl;
  final String name;
  final String region;
  final DateTime teamCreationDate;
  final List<TeamMember> memberList;

  TeamDetails(
      {required this.id,
      this.imageUrl,
      required this.name,
      required this.region,
      required this.teamCreationDate,
      required this.memberList});

  factory TeamDetails.fromMap(Map<String, dynamic> map) {
    return TeamDetails(
        id: map["_id"],
        imageUrl: map["imageString"],
        name: map["teamName"],
        region: map["region"],
        teamCreationDate: DateTime.parse(map["teamCreationDate"]),
        memberList: (map["memberList"] as List)
            .map((item) => TeamMember.fromMap(item as Map<String, dynamic>))
            .toList());
  }
}
