import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String _username = "";
  String _password = "";

  String get getUsername => _username;
  String get getPassword => _password;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }
}
