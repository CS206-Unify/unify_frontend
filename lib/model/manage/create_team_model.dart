import 'package:flutter/material.dart';

class CreateTeamModel extends ChangeNotifier {
  String _teamName = "";
  String _region = "";
  String _gameName = "";
  int _maximumTeamSize = 0;

  String get getTeamName => _teamName;
  String get getRegion => _region;
  String get getGameName => _gameName;
  int get getMaximumTeamSize => _maximumTeamSize;

  void setTeamName(String teamName){
    _teamName = teamName;
    notifyListeners();
  }

  void setRegion(String region){
    _region = region;
    notifyListeners();
  }

  void setGameName(String gameName){
    _gameName = gameName;
    notifyListeners();
  }

  void setMaximumTeamSize(int maximumTeamSize){
    _maximumTeamSize = maximumTeamSize;
    notifyListeners();
  }
}