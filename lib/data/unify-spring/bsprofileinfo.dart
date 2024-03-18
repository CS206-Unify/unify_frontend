import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:unify/data/unify-spring/serializers/authentication/bsprofile_serializer.dart';
import 'package:unify/main.dart';
import 'package:unify/utils/constants/unify_backend.dart';
import 'package:unify/utils/local_storage/secure_storage.dart';

Future<BSProfileRequest> getBSProfile() async {
  try {
    final res = await http.get(Uri.parse("$unifyServerBaseUrl/profile"), headers: {
      HttpHeaders.authorizationHeader:
          "Bearer ${await SecureStorage.getToken()}"
    });

    if (res.statusCode == 200) {
      var bsProfileRequest = json.decode(res.body)["user"]["bsProfile"] as Map<String, dynamic>;
      var bsProfile = BSProfileRequest.fromJson(bsProfileRequest);

      return bsProfile;

    } else {
      throw Error();
    }
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}

Future<void> putBSProfile(BSProfileRequest bsProfileRequest) async {
  try {
    final res = await http.put(
      Uri.parse("$unifyServerBaseUrl/bsProfile"),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${await SecureStorage.getToken()}",
        HttpHeaders.contentTypeHeader: "application/json", // Specify content type
      },
      body: jsonEncode(bsProfileRequest.toJson()), // Convert request body to JSON
    );

    if (res.statusCode == 200) {
      var bsProfileRequest = json.decode(res.body) as Map<String, dynamic>;
      SnackBarService.showSnackBar(content: bsProfileRequest["message"]) ;
    } else {
      throw Error();
    }
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
    rethrow;
  }
}
