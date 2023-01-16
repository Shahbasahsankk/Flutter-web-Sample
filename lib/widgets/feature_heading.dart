import 'package:flutter/material.dart';

class FeatureHeading extends StatelessWidget {
  const FeatureHeading({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: screenSize.width < 800
          ? Column(
              children: const [
                Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF077bd7),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Clue of the wooden cottage',
                  textAlign: TextAlign.end,
                ),
              ],
            )
          : Row(
              children: const [
                Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF077bd7),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Clue of the wooden cottage',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
    );
  }
}
