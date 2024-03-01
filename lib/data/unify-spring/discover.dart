import 'dart:convert';
import 'dart:io';
import 'package:unify/data/unify-spring/serializers/discover/battle_history_serializer.dart';
import 'package:unify/data/unify-spring/serializers/discover/profile_details_serializer.dart';
import 'package:unify/data/unify-spring/serializers/discover/profile_listing_serializer.dart';
import 'package:http/http.dart' as http;
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

Future<BattleHistory> getBrawlStarHistory(String playerTag) async {
  try {
    final res = await http.get(
        Uri.parse("https://api.brawlstars.com/v1/players/$playerTag/battlelog"),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjAxMDY5OTI2LTg4MjMtNGQxMi04YjAwLThmYjUzNjUxMGQ2YiIsImlhdCI6MTcwOTI5NzEyNSwic3ViIjoiZGV2ZWxvcGVyLzFlZDQ1OTZmLWE2MjUtZjExMi0zOTI3LTkwYzBiNGE1NzQ2NyIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiMC4wLjAuMCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.T9EJA1zpRGfxNlzcRY60tmcTfXXVfRFjsbjtM8TuB9uaVMYPXUDeyFVRr7EpKWHrYylibuKlp5a9yPCPmhD1HA",
        });

    if (res.statusCode == 200) {
      Map<String, int> map =
          Map.fromEntries({"victory": 0, "defeat": 0, "draw": 0}.entries);

      for (var item in (json.decode(res.body)["items"] as List<dynamic>)) {
        String battleResult = item["battle"]["result"];
        map[battleResult] = (map[battleResult] ?? 0) + 1;
      }

      return BattleHistory(
          wins: map["victory"] ?? 0,
          loses: map["defeat"] ?? 0,
          draws: map["draw"] ?? 0);

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
