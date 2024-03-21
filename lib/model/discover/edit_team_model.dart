import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/data/unify-spring/serializers/discover/team_details_model.dart';

class EditTeamModel extends ChangeNotifier {
  String _teamName = "";
  String _region = "";
  int _maxTeamSize = 3;
  int _minTrophies = 0;
  int _minWins3v3 = 0;
  int _minWins2v2 = 0;
  int _minSoloWins = 0;

  String get getTeamName => _teamName;
  String get getRegion => _region;
  int get getMaxTeamSize => _maxTeamSize;
  int get getMinTrophies => _minTrophies;
  int get getMinWins3v3 => _minWins3v3;
  int get getMinWins2v2 => _minWins2v2;
  int get getMinSoloWins => _minSoloWins;

  void setTeamName(String teamName) {
    _teamName = teamName;
    notifyListeners();
  }

  void setRegion(String region) {
    _region = region;
    notifyListeners();
  }

  void setMaxTeamSize(int maxTeamSize) {
    _maxTeamSize = maxTeamSize;
    notifyListeners();
  }

  void setMinTrophies(int minTrophies) {
    _minTrophies = minTrophies;
    notifyListeners();
  }

  void setMinWins3v3(int minWins3v3) {
    _minWins3v3 = minWins3v3;
    notifyListeners();
  }

  void setMinWins2v2(int minWins2v2) {
    _minWins2v2 = minWins2v2;
    notifyListeners();
  }

  void setMinWinsSolo(int minSoloWins) {
    _minSoloWins = minSoloWins;
    notifyListeners();
  }

  Future<void> getTeamById(String teamId) async {
    try {
      TeamDetails teamDetails = await getTeamDetailsById(teamId);
      _teamName = teamDetails.name;
      _region = teamDetails.region;
      _maxTeamSize = teamDetails.maxTeamSize;
      _minTrophies = teamDetails.trophyRequirements;
      _minWins3v3 = teamDetails.min3v3Wins;
      _minWins2v2 = teamDetails.minDuoWins;
      _minSoloWins = teamDetails.minSoloWins;
    } catch (e) {
      Logger().d(e.toString());
    }

    notifyListeners();
  }
}
