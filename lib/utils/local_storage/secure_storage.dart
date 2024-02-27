import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> setToken(String value) async {
    await _storage.write(key: "token", value: value);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: "token");
  }

  static void deleteToken() async {
    await _storage.delete(key: "token");
  }
}
