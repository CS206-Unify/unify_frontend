import 'package:flutter/material.dart';

class FiltersModel extends ChangeNotifier {
  String _region = "";
  int _trophies = 0;
  int _wins3v3 = 0;
  int _wins2v2 = 0;
  int _soloWins = 0;

  String get getRegion => _region;
  int get getTrophies => _trophies;
  int get getWins3v3 => _wins3v3;
  int get getWins2v2 => _wins2v2;
  int get getSoloWins => _soloWins;

  void setRegion(String region) {
    _region = region;
    notifyListeners();
  }

  void setTrophies(int trophies) {
    _trophies = trophies;
    notifyListeners();
  }

  void setWins3v3(int wins3v3) {
    _wins3v3 = wins3v3;
    notifyListeners();
  }

  void setWins2v2(int wins2v2) {
    _wins2v2 = wins2v2;
    notifyListeners();
  }

  void setSoloWins(int soloWins) {
    _soloWins = soloWins;
    notifyListeners();
  }
}
