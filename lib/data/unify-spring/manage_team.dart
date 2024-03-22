import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:unify/data/unify-spring/serializers/error/common_error_serializer.dart';
import 'package:unify/data/unify-spring/serializers/manage/edit_team_serializer.dart';
import 'package:unify/main.dart';
import 'package:unify/utils/constants/unify_backend.dart' as unify_client;
import 'package:unify/utils/local_storage/secure_storage.dart';

Future<void> editTeam(String teamId, EditTeamRequest request) async {
  try {
    final res =
        await http.put(Uri.parse("${unify_client.unifyTeamServiceUrl}/$teamId"),
            headers: {
              HttpHeaders.authorizationHeader:
                  "Bearer ${await SecureStorage.getToken()}",
              HttpHeaders.contentTypeHeader: "application/json",
            },
            body: jsonEncode(request.toJson()));

    if (res.statusCode == 200) {
      SnackBarService.showSnackBar(content: "Update is sucessful!");
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
