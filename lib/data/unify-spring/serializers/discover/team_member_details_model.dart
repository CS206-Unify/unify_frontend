class TeamMemberDetails {
  final String name;
  final int trophies;
  final String imageUrl;

  TeamMemberDetails({
    required this.name,
    required this.trophies,
    required this.imageUrl,
  });

  factory TeamMemberDetails.fromMap(Map<String, dynamic> map) {
    return TeamMemberDetails(
      name: map["name"],
      trophies: map["trophies"],
      imageUrl: map["imageUrl"],
    );
  }
}
