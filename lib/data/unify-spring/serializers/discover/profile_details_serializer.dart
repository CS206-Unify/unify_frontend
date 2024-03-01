import 'package:unify/data/unify-spring/serializers/discover/brawler_details_serializer.dart';

class ProfileDetails {
  final String id;
  final String username;
  final String region;
  final int trophies;
  final String imgUrl;
  final String bio;
  // final int wins;
  // final int loses;
  // final int draws;
  final List<String> teams;
  final int wins3v3;
  final int wins2v2;
  final int winsSolo;
  final List<BrawlerDetails> brawlers;

  ProfileDetails(
      {required this.id,
      required this.username,
      required this.region,
      required this.trophies,
      required this.imgUrl,
      required this.bio,
      // required this.wins,
      // required this.loses,
      // required this.draws,
      required this.teams,
      required this.wins3v3,
      required this.wins2v2,
      required this.winsSolo,
      required this.brawlers});

  factory ProfileDetails.fromMap(Map<String, dynamic> map) {
    return ProfileDetails(
        id: map["_id"],
        username: map["username"],
        region: map["bsProfile"]["region"],
        trophies: map["bsProfile"]["trophies"],
        imgUrl: map["imageString"],
        bio: map["bsProfile"]["personalBio"],
        // wins: wins,
        // loses: loses,
        // draws: draws,
        teams: map["teams"],
        wins3v3: map["threeVsThreeVictories"],
        wins2v2: map["duoVictories"],
        winsSolo: map["soloVictories"],
        brawlers: (map["bsProfile"]["brawlers"] as List<Map<String, dynamic>>)
            .map((item) => BrawlerDetails.fromJson(item))
            .toList());
  }
}
