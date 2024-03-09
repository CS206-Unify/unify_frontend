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
