import 'package:flutter/material.dart';

class InviteToTeamModel extends ChangeNotifier {
  final Map<String, bool> _checkboxes = {};

  bool getValueByKey(String key) => _checkboxes[key] ?? false;

  Map<String, bool> get getMap => _checkboxes;

  void setValueByKey(String key, bool value) {
    _checkboxes[key] = value;
    notifyListeners();
  }
}
