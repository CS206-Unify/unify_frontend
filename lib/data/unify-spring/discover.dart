import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:unify/data/unify-spring/serializers/discover/profile_details_serializer.dart';
import 'package:unify/data/unify-spring/serializers/discover/profile_listing_serializer.dart';
import 'package:http/http.dart' as http;
import 'package:unify/data/unify-spring/serializers/discover/user_bs_teams_serializer.dart';
import 'package:unify/data/unify-spring/serializers/error/common_error_serializer.dart';
import 'package:unify/main.dart';
import 'package:unify/utils/constants/unify_backend.dart';
import 'package:unify/utils/local_storage/secure_storage.dart';

Future<List<ProfileListing>> discoverProfile(
    String region,
    int trophies,
    int wins3v3,
    int wins2v2,
    int winsSolo,
    int pageSize,
    int pageNumber) async {
  try {
    final res = await http.get(
        Uri.parse(
            "$unifyDiscoverServiceUrl/profile?region=$region&language=English&trophies=$trophies&threeVThreeWins=$wins3v3&twoVTwoWins=$wins2v2&soloWins=$winsSolo&pageSize=$pageSize&pageNumber=$pageNumber"),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${await SecureStorage.getToken()}"
        });

    List<ProfileListing> profiles =
        (json.decode(res.body)['bsProfileListingList'] as List)
            .map((item) => ProfileListing.fromMap(item))
            .toList();

    return profiles;
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}

Future<ProfileDetails> getProfileById(String userId) async {
  try {
    final res = await http
        .get(Uri.parse("$unifyProfileServiceUrl/userId/$userId"), headers: {
      HttpHeaders.authorizationHeader:
          "Bearer ${await SecureStorage.getToken()}",
    });

    if (res.statusCode == 200) {
      ProfileDetails profile = ProfileDetails.fromMap(
          json.decode(res.body)["user"] as Map<String, dynamic>);

      return profile;
    } else {
      SnackBarService.showSnackBar(
          content: CommonError.fromJson(
                  json.decode(res.body) as Map<String, dynamic>)
              .message!);
      throw Error();
    }
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}

Future<List<UserBsTeamsListing>> getUserBsTeamsListing() async {
  try {
    List<UserBsTeamsListing> teams = [
      UserBsTeamsListing(id: "a", name: "Team Ninja", imgUrl: ""),
      UserBsTeamsListing(id: "b", name: "Rogue Esports", imgUrl: ""),
      UserBsTeamsListing(id: "c", name: "Hornets Gaming", imgUrl: ""),
      UserBsTeamsListing(id: "d", name: "ROM Esports Club", imgUrl: ""),
      UserBsTeamsListing(id: "e", name: "Spartans Squad", imgUrl: ""),
      UserBsTeamsListing(id: "f", name: "Evil Geniuses", imgUrl: ""),
    ];

    return teams;
    // final res = await http.get(Uri.parse("$unifyProfileServiceUrl/team"),
    //     headers: {
    //       HttpHeaders.authorizationHeader:
    //           "Bearer ${await SecureStorage.getToken()}"
    //     });

    // if (res.statusCode == 200) {
    //   List<UserBsTeamsListing> teams =
    //       (json.decode(res.body)["bsTeams"] as List)
    //           .map((item) => UserBsTeamsListing.fromMap(item))
    //           .toList();

    //   return teams;
    // }

    // SnackBarService.showSnackBar(
    //     content:
    //         CommonError.fromJson(json.decode(res.body) as Map<String, dynamic>)
    //             .message!);
    // throw Error();
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}

Future<void> inviteToTeamById(String teamId, String toAddUserId) async {
  try {
    // await http.post(
    //     Uri.parse("$unifyTeamServiceUrl/$teamId/member/$toAddUserId"),
    //     headers: {
    //       HttpHeaders.authorizationHeader:
    //           "Bearer ${await SecureStorage.getToken()}"
    //     });
    Logger().d("$unifyTeamServiceUrl/$teamId/member/$toAddUserId");
    return;
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}
