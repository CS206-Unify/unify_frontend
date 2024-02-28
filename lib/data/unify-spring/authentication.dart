import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unify/data/unify-spring/serializers/authentication/login_serializer.dart';
import 'package:unify/data/unify-spring/serializers/authentication/registration_serializer.dart';
import 'package:unify/data/unify-spring/serializers/authentication/token_serializer.dart';
import 'package:unify/data/unify-spring/serializers/error/common_error_serializer.dart';
import 'package:unify/main.dart';
import 'package:unify/router.dart';
import 'package:unify/utils/constants/unify_backend.dart' as unify_client;
import 'package:unify/utils/local_storage/secure_storage.dart';

void register(RegisterRequest registerRequest) async {
  try {
    final res = await http.post(
        Uri.parse("${unify_client.unifyAuthenticationServiceUrl}/register"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(registerRequest.toJson()));

    if (res.statusCode == 201) {
      final String? token =
          TokenResponse.fromJson(json.decode(res.body) as Map<String, dynamic>)
              .token;

      if (token == null || token.isEmpty) {
        SnackBarService.showSnackBar(
            content:
                "There is an error trying to set the user token, please try registering again");
        return;
      }

      await SecureStorage.setToken(token);
      router.go("/home");
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

void login(LoginRequest loginRequest) async {
  try {
    final res = await http.post(
        Uri.parse("${unify_client.unifyAuthenticationServiceUrl}/authenticate"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(loginRequest.toJson()));

    if (res.statusCode == 200) {
      final String? token =
          TokenResponse.fromJson(json.decode(res.body) as Map<String, dynamic>)
              .token;

      if (token == null || token.isEmpty) {
        SnackBarService.showSnackBar(
            content:
                "There is an error trying to set the user token, please try registering again");
        return;
      }

      await SecureStorage.setToken(token);
      router.go('/home');
    } else {
      SnackBarService.showSnackBar(
          content: CommonError.fromJson(
                  json.decode(res.body) as Map<String, dynamic>)
              .message!);
    }
  } catch (e) {
    SnackBarService.showSnackBar(content: e.toString());
  }
}
