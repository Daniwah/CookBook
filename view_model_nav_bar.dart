import 'package:flutter/material.dart';

class NavBarViewModel with ChangeNotifier {
  int currentIndex = 1;

  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  void aturulang() {
    currentIndex = 1;
    notifyListeners();
  }
}
