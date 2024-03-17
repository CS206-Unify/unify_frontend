import 'dart:convert';

import 'package:http/http.dart' as http;
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
