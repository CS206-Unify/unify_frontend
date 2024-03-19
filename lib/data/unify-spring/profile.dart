import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unify/data/unify-spring/serializers/profile/userprofile_serializer.dart';
import 'package:unify/model/profile/userprofile_model.dart';
import 'package:unify/utils/local_storage/secure_storage.dart';

Future<UserProfile> getUserProfile() async {
  final url = Uri.parse('http://10.0.2.2:8080/api/profile');
  final response = await http.get(url, headers: {
    'Authorization': 'Bearer ${await SecureStorage.getToken()}',
  });

  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
    return UserProfile.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user profile');
  }
}

Future<void> putCountryForUserProfile(String? country) async {
  final url = Uri.parse('http://10.0.2.2:8080/api/profile');
  var userProfile = UserProfileRequest(
    imageString: "null",
    country: '$country',
    language: "English",
  );

  final response = await http.put(
    url,
    headers: {
      'Authorization': 'Bearer ${await SecureStorage.getToken()}',
      'Content-Type': 'application/json',
    },
    body: json.encode(userProfile.toJson()),
  );

  if (response.statusCode == 200) {
    print('PUT Request success!');
    return;
  } else {
    throw Exception('Failed to update user profile');
  }
}
