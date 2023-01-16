import 'package:flutter/cupertino.dart';

class ResponsiveController with ChangeNotifier {
  bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }
}
