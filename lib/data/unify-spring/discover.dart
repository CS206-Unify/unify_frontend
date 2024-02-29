import 'dart:convert';
import 'dart:io';

import 'package:unify/data/unify-spring/serializers/discover/profile_listing_serializer.dart';
import 'package:http/http.dart' as http;
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

    List<ProfileListing> profiles = (json.decode(res.body)['bsProfileListingList'] as List)
        .map((item) => ProfileListing.fromMap(item))
        .toList();

    return profiles;
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}
