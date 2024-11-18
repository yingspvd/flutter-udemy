import 'dart:math';

import 'package:flutter/cupertino.dart';

class FortuneModel with ChangeNotifier {
  String _currentFortune = "";

  final _fortuneList = [
    "Test1",
    "Test2",
    "Test3",
    "Test4",
    "Test5",
    "Test6",
  ];

  String get currentFortune => _currentFortune;

  FortuneModel() {
    _generateRandomFortune();
  }

  void _generateRandomFortune() {
    var random = Random();
    int randNum = random.nextInt(_fortuneList.length);
    _currentFortune = _fortuneList[randNum];
    notifyListeners();
  }

  // Method to get a new random fortune
  void getNewFortune() {
    _generateRandomFortune();
  }
}
