import 'dart:convert';
import 'dart:io';

import 'package:unify/data/unify-spring/serializers/error/common_error_serializer.dart';
import 'package:unify/data/unify-spring/serializers/manage/create_team_serializer.dart';
import 'package:http/http.dart' as http;
import 'package:unify/main.dart';
import 'package:unify/router.dart';
import 'package:unify/utils/constants/unify_backend.dart' as unify_client;
import 'package:unify/utils/local_storage/secure_storage.dart';

void createTeam(CreateTeamRequest createTeamRequest) async {
  try {

    final result = await http.get(
        Uri.parse(unify_client.unifyProfileServiceUrl),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${await SecureStorage.getToken()}",
          HttpHeaders.contentTypeHeader: "application/json",
        },);

    if (result.statusCode == 200) {
      // Parse the response body
      final Map<String, dynamic> body = json.decode(result.body);
      
      final Map<String, dynamic> user = body['user'];
      createTeamRequest.language = user['language'];
      
    } else {
      // Handle HTTP error
      throw Exception('Failed to get user details: ${result.statusCode}');
    }

    final res = await http.post(
        Uri.parse("${unify_client.unifyServerBaseUrl}/team"),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${await SecureStorage.getToken()}",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(createTeamRequest.toJson()));
        

    if (res.statusCode == 201) {      
      router.go("/manage");
    } else {
      SnackBarService.showSnackBar(
          content: CommonError.fromJson(
                  json.decode(res.body) as Map<String, dynamic>)
              .message!);
    }

    return;
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
  }
}