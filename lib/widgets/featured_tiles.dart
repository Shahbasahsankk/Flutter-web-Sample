import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/controllers/featured_tiles_controller.dart';

class FeaturedTiles extends StatelessWidget {
  const FeaturedTiles({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final featuredTileController =
        Provider.of<FeaturedTileController>(context, listen: false);
    return screenSize.width < 800
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: screenSize.width / 5),
                  ...Iterable<int>.generate(
                          featuredTileController.featuredAssets.length)
                      .map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: screenSize.width / 2.5,
                              width: screenSize.width / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  featuredTileController
                                      .featuredAssets[pageIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenSize.height / 70),
                              child: Text(
                                featuredTileController.titles[pageIndex],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: screenSize.width / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(
                        featuredTileController.featuredAssets.length)
                    .map(
                  (int pageIndex) => Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 3.6,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(featuredTileController
                                  .featuredAssets[pageIndex]),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 20,
                                spreadRadius: 5,
                                color: Colors.grey.withOpacity(0.3),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height / 70),
                        child: Text(
                          featuredTileController.titles[pageIndex],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
