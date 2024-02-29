class ProfileListing {
  final String id;
  final String name;
  final int trophies;
  final int wins3v3;
  final String region;
  final String brawler;
  final int rank;

  ProfileListing(
      {required this.id,
      required this.name,
      required this.trophies,
      required this.wins3v3,
      required this.region,
      required this.brawler,
      required this.rank});

  factory ProfileListing.fromMap(Map<String, dynamic> map) {
    return ProfileListing(
      id: map["_id"],
      name: map["username"],
      trophies: map["trophies"],
      wins3v3: map["threeVThreeWins"],
      region: map["region"],
      brawler: map["bestBrawlerName"],
      rank: map["bestBrawlerRank"],
    );
  }
}
