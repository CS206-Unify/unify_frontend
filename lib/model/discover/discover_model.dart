import 'package:flutter/material.dart';

class DiscoverModel extends ChangeNotifier {
  String _game = "";

  String get getGame => _game;

  void setGame(String game){
    _game = game;
    notifyListeners();
  }
}