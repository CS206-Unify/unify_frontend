import 'package:unify/data/unify-spring/serializers/discover/brawler_details_serializer.dart';

class ProfileDetails {
  final String id;
  final String username;
  final String region;
  final int trophies;
  final String imgUrl;
  final String bio;
  final String joinDate;
  final List<String> teams;
  final int wins3v3;
  final int wins2v2;
  final int winsSolo;
  final List<BrawlerDetails> brawlers;
  final String playerTag;

  ProfileDetails(
      {required this.id,
      required this.username,
      required this.region,
      required this.trophies,
      required this.imgUrl,
      required this.bio,
      required this.joinDate,
      required this.teams,
      required this.wins3v3,
      required this.wins2v2,
      required this.winsSolo,
      required this.brawlers, required this.playerTag});

  factory ProfileDetails.fromMap(Map<String, dynamic> map) {
    return ProfileDetails(
        id: map["_id"],
        playerTag: map["bsProfile"]["playerTag"],
        username: map["username"],
        region: map["bsProfile"]["region"],
        trophies: map["bsProfile"]["player"]["trophies"],
        imgUrl: map["imageString"],
        bio: map["bsProfile"]["personalBio"],
        joinDate: map["userCreationDate"],
        teams: (map["teams"] as List).map((item) => item as String).toList(),
        wins3v3: map["bsProfile"]["player"]["threeVsThreeVictories"],
        wins2v2: map["bsProfile"]["player"]["duoVictories"],
        winsSolo: map["bsProfile"]["player"]["soloVictories"],
        brawlers: (map["bsProfile"]["player"]["brawlers"]
                as List)
            .map((item) => BrawlerDetails.fromJson(item))
            .toList());
  }
}
