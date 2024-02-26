import 'package:flutter/material.dart';

class RegistrationModel extends ChangeNotifier {
  String _username = "";
  String _email = "";
  String _password = "";

  String get getUsername => _username;
  String get getEmail => _email;
  String get getPassword => _password;

  void setUsername(String username){
    _username = username;
    notifyListeners();
  }

  void setEmail(String email){
    _email = email;
    notifyListeners();
  }

  void setPassword(String password){
    _password = password;
    notifyListeners();
  }
}