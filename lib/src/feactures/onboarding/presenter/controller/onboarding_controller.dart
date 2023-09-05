import 'package:flutter/material.dart';

class OnBoardingController extends ChangeNotifier {
  late PageController pageController;
  int currentPage = 0;
  void init() {
    pageController = PageController(initialPage: 0);
    notifyListeners();
  }

  void onChangedPage(int value) {
    currentPage = value;
    notifyListeners();
  }
}
