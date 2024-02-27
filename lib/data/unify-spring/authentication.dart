import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:unify/data/unify-spring/serializers/authentication/registration_serializer.dart';
import 'package:unify/data/unify-spring/serializers/error/common_error_serializer.dart';
import 'package:unify/main.dart';
import 'package:unify/utils/constants/unify_backend.dart' as unify_client;

void register(RegisterRequest registerRequest, BuildContext context) async {
  try {
    final res = await http.post(
        Uri.parse("${unify_client.unifyAuthenticationServiceUrl}/register"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(registerRequest.toJson()));

    if (res.statusCode == 201 && context.mounted) {
      context.go("/home");
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
