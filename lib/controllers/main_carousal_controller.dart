import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class MainCarousalController with ChangeNotifier {
  final CarouselController carousalController = CarouselController();
  int current = 0;
  final List<String> images = [
    'assets/carousals/image1.jpg',
    'assets/carousals/image2.jpg',
    'assets/carousals/image3.jpg',
    'assets/carousals/image4.jpg',
    'assets/carousals/image5.jpg',
    'assets/carousals/image6.jpg',
    'assets/carousals/image7.jpg'
  ];
  final List<String> places = [
    'Finland',
    'Canada',
    'Singapore',
    'Amazon',
    'England',
    'Iceland',
    'India',
  ];
  final List<bool> isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final List<bool> isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<Widget> generateImageTiles(Size screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  void pageChange(int index, List<Widget> imageSliders) {
    current = index;
    notifyListeners();
    for (int i = 0; i < imageSliders.length; i++) {
      if (i == index) {
        isSelected[i] = true;
        notifyListeners();
      } else {
        isSelected[i] = false;
        notifyListeners();
      }
    }
  }

  void hoverChange(bool value, int index) {
    if (value == true) {
      isHovering[index] = true;
    } else {
      isHovering[index] = false;
    }
  }
}
