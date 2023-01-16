import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/controllers/main_carousal_controller.dart';

class MainCarousal extends StatelessWidget {
  const MainCarousal({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCarousalController =
        Provider.of<MainCarousalController>(context, listen: false);
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = mainCarousalController.generateImageTiles(screenSize);
    return Consumer<MainCarousalController>(builder: (context, values, _) {
      return Stack(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                values.pageChange(index, imageSliders);
              },
            ),
            carouselController: values.carousalController,
          ),
          AspectRatio(
            aspectRatio: 18 / 8,
            child: Center(
              child: Text(
                values.places[values.current],
                style: TextStyle(
                  letterSpacing: 8,
                  fontSize: screenSize.width / 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          screenSize.width < 800
              ? Container()
              : AspectRatio(
                  aspectRatio: 17 / 8,
                  child: Center(
                    heightFactor: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenSize.width / 8,
                          right: screenSize.width / 8,
                        ),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: screenSize.height / 50,
                              bottom: screenSize.height / 50,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (int i = 0; i < values.places.length; i++)
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onHover: (value) =>
                                            values.hoverChange(value, i),
                                        onTap: () => values.carousalController
                                            .animateToPage(i),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: screenSize.height / 80,
                                            bottom: screenSize.height / 90,
                                          ),
                                          child: Text(
                                            values.places[i],
                                            style: TextStyle(
                                              color: values.isHovering[i]
                                                  ? Colors.blueGrey[900]
                                                  : Colors.blueGrey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        maintainSize: true,
                                        maintainState: true,
                                        maintainAnimation: true,
                                        visible: values.isSelected[i],
                                        child: AnimatedOpacity(
                                          opacity: values.isSelected[i] ? 1 : 0,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          child: Container(
                                            height: 5,
                                            width: screenSize.width / 10,
                                            decoration: const BoxDecoration(
                                              color: Colors.blueGrey,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      );
    });
  }
}
