import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.text,
    required this.type,
  });
  final String text;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type :',
          style: TextStyle(
            color: Colors.blueGrey[100],
            fontSize: 16,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white60,
            ),
          ),
        ),
      ],
    );
  }
}
