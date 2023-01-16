import 'package:flutter/cupertino.dart';

class FeaturedTileController with ChangeNotifier {
  final List<String> featuredAssets = [
    'assets/scifi.jpg',
    'assets/romance.jpg',
    'assets/photography.jpg',
  ];

  final List<String> titles = [
    'Sci-Fi',
    'Romance',
    'Photography',
  ];
}
