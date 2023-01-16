import 'package:flutter/cupertino.dart';

class TopBarController with ChangeNotifier {
  final List<bool> isHovering = [
    false,
    false,
    false,
    false,
  ];

  void hoverChange(int index, bool value) {
    isHovering[index] = value;
    notifyListeners();
  }
}
