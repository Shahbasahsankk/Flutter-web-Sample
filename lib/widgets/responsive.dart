import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.largerScreen,
    this.mediumScreen,
    this.smallScreen,
  });
  final Widget largerScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      if (contraints.maxWidth > 1200) {
        return largerScreen;
      } else if (contraints.maxWidth <= 1200 && contraints.maxWidth >= 800) {
        return mediumScreen ?? largerScreen;
      } else {
        return smallScreen ?? largerScreen;
      }
    });
  }
}
