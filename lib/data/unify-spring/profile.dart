import 'dart:convert';

import 'package:unify/data/unify-spring/serializers/profile/userprofile_serializer.dart';
import 'package:http/http.dart' as http;
import 'package:unify/utils/local_storage/secure_storage.dart';

Future<UserProfile> getUserProfile() async {
  final url = Uri.parse('http://localhost:8080/api/profile');
  final request = await http.get(url, headers: {
    'Authorization': 'Bearer ${await SecureStorage.getToken()}',
  });

  if (request.statusCode == 200) {
    UserProfile userProfile = json
        .decode(request.body)
        .map((item) => UserProfile.fromMap(item))
        .toList();
    return userProfile;
  } else {
    throw Exception('Failed to create user profile');
  }
}
