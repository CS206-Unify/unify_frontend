import 'dart:convert';
import 'dart:io';
import 'package:unify/data/unify-spring/serializers/discover/profile_details_serializer.dart';
import 'package:unify/data/unify-spring/serializers/discover/profile_listing_serializer.dart';
import 'package:http/http.dart' as http;
import 'package:unify/data/unify-spring/serializers/discover/team_details_model.dart';
import 'package:unify/data/unify-spring/serializers/discover/team_listing_model.dart';
import 'package:unify/data/unify-spring/serializers/discover/team_member_model.dart';
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
            "$unifyDiscoverServiceUrl/profile?region=${region == "" ? "Any" : region}&language=English&trophies=$trophies&threeVThreeWins=$wins3v3&twoVTwoWins=$wins2v2&soloWins=$winsSolo&pageSize=$pageSize&pageNumber=$pageNumber"),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${await SecureStorage.getToken()}"
        });

    List<ProfileListing> profiles =
        (json.decode(res.body)['bsProfileListingList'] as List<dynamic>)
            .map((item) => ProfileListing.fromMap(item as Map<String, dynamic>))
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
    final res = await http.get(Uri.parse("$unifyProfileServiceUrl/team"),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${await SecureStorage.getToken()}"
        });

    if (res.statusCode == 200) {
      List<UserBsTeamsListing> teams =
          (json.decode(res.body)["bsTeams"] as List)
              .map((item) => UserBsTeamsListing.fromMap(item))
              .toList();

      return teams;
    }

    SnackBarService.showSnackBar(
        content:
            CommonError.fromJson(json.decode(res.body) as Map<String, dynamic>)
                .message!);
    throw Error();
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}

Future<void> inviteToTeamById(String teamId, String toAddUserId) async {
  try {
    await http.post(
        Uri.parse("$unifyTeamServiceUrl/$teamId/member/$toAddUserId"),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${await SecureStorage.getToken()}"
        });
    return;
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}

Future<List<TeamListing>> discoverTeam(String region, int trophies, int wins3v3,
    int wins2v2, int winsSolo, int pageSize, int pageNumber) async {
  try {
    final res = await http.get(
        Uri.parse(
            "$unifyDiscoverServiceUrl/team?region=${region == "" ? "Any" : region}&language=English&trophies=$trophies&threeVThreeWins=$wins3v3&twoVTwoWins=$wins2v2&soloWins=$winsSolo&pageSize=$pageSize&pageNumber=$pageNumber"),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${await SecureStorage.getToken()}"
        });

    print(json.decode(res.body));

    List<TeamListing> teams =
        (json.decode(res.body)['bsTeamListings'] as List<dynamic>)
            .map((item) => TeamListing.fromMap(item as Map<String, dynamic>))
            .toList();

    return teams;
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}

Future<TeamDetails> getTeamDetailsById(String teamId) async {
  try {
    final res = await http
        .get(Uri.parse("http://10.0.2.2:8080/api/team/$teamId"), headers: {
      HttpHeaders.authorizationHeader:
          "Bearer ${await SecureStorage.getToken()}"
    });

    print(json.decode(res.body)["bsTeam"]);

    return TeamDetails.fromMap(
        json.decode(res.body)["bsTeam"] as Map<String, dynamic>);
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}
