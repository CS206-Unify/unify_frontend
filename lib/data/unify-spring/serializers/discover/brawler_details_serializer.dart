class BrawlerDetails {
  final String name;
  final int rank;
  final int trophies;

  BrawlerDetails(
      {required this.name, required this.rank, required this.trophies});

  BrawlerDetails.fromJson(Map<String, dynamic> json)
      : name = json["name"] as String,
        rank = json["rank"] as int,
        trophies = json["trophies"] as int;

  // Map<String, dynamic> toJson() => _$BrawlerDetailsToJson(this);

  // factory BrawlerDetails.fromMap(Map<String, dynamic> map) {
  //   return BrawlerDetails(
  //       name: map["name"], rank: map["rank"], trophies: map["trophies"]);
  // }
}
