class TeamMemberDetails {
  final String name;
  final int? trophies;
  final String? imageUrl;

  TeamMemberDetails({
    required this.name,
    this.trophies,
    this.imageUrl,
  });

  factory TeamMemberDetails.fromMap(Map<String, dynamic> map) {
    return TeamMemberDetails(
      name: map["username"],
      trophies: map["trophies"],
      imageUrl: map["imageString"],
    );
  }
}
