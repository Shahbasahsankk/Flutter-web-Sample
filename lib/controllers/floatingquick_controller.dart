import 'package:flutter/material.dart';

class FloatingQuickController with ChangeNotifier {
  List<bool> isHovering = [
    false,
    false,
    false,
    false,
  ];
  final List<Widget> _rowElements = [];
  List<String> items = [
    'History',
    'Science',
    'Phylosophy',
    'Novels',
  ];
  List<IconData> icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny,
  ];

  List<Widget> generateRowElements(Size screenSize) {
    _rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          value ? isHovering[i] = true : isHovering[i] = false;
          notifyListeners();
        },
        onTap: () {},
        child: Text(
          items[i],
          style: TextStyle(
              color: isHovering[i] ? Colors.blueGrey[900] : Colors.blueGrey),
        ),
      );
      Widget spacer = SizedBox(
        height: screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      _rowElements.add(elementTile);
      if (i < items.length - 1) {
        _rowElements.add(spacer);
      }
    }
    return _rowElements;
  }

  void hoverChange(bool value, int index) {
    if (value == true) {
      isHovering[index] = true;
      notifyListeners();
    } else {
      isHovering[index] = false;
      notifyListeners();
    }
  }
}
