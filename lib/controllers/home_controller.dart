import 'package:flutter/cupertino.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    scrollController.addListener(_scrollListener);
  }
  final ScrollController scrollController = ScrollController();
  double scrollPosition = 0;
  double opacity = 0;

  void _scrollListener() {
    scrollPosition = scrollController.position.pixels;
  }

  void opacityChange(Size screenSize) {
    opacity = scrollPosition < screenSize.height * 0.40
        ? scrollPosition / (screenSize.height * 0.40)
        : 1;
    notifyListeners();
  }
}
