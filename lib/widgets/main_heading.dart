import 'package:flutter/material.dart';

class MainHeading extends StatelessWidget {
  const MainHeading({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: screenSize.height / 10,
        bottom: screenSize.height / 15,
      ),
      width: screenSize.width,
      child: const Text(
        'Knowledge Diversity',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF077bd7),
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
