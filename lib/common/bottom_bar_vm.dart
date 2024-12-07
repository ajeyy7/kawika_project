import 'package:flutter/material.dart';

class BottomBarVm extends ChangeNotifier {
  var currentIndex = 0;
  void navigate(index) {
    currentIndex = index;
    notifyListeners();
  }
}
