class TeamListing {
  final String id;
  final String? imageUrl;
  final String name;
  final String? region;
  final int trophies;
  final int wins3v3;
  final int wins2v2;
  final int soloWins;

  TeamListing(
      {required this.id,
      this.imageUrl,
      required this.name,
      this.region,
      required this.trophies,
      required this.wins3v3,
      required this.wins2v2,
      required this.soloWins});

  factory TeamListing.fromMap(Map<String, dynamic> map) {
    return TeamListing(
        id: map["_id"],
        imageUrl: map["imageString"],
        name: map["teamName"],
        region: map["region"],
        trophies: map["trophyRequirements"],
        wins3v3: map["min3v3Wins"],
        wins2v2: map["minDuoWins"],
        soloWins: map["minSoloWins"]);
  }
}
