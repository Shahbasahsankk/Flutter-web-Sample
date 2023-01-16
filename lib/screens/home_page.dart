import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/controllers/home_controller.dart';
import 'package:web_sample/widgets/bottom_bar.dart';
import 'package:web_sample/widgets/feature_heading.dart';
import 'package:web_sample/widgets/featured_tiles.dart';
import 'package:web_sample/widgets/floating_quick_accessbar.dart';
import 'package:web_sample/widgets/main_carousal.dart';
import 'package:web_sample/widgets/main_heading.dart';
import 'package:web_sample/widgets/menu_drawer.dart';
import 'package:web_sample/widgets/top_bar_contents.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeController>();
    var screenSize = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeProvider.opacityChange(screenSize);
    });
    return Consumer<HomeController>(builder: (context, values, _) {
      return Scaffold(
        drawer: const MenuDrawer(),
        extendBodyBehindAppBar: true,
        appBar: screenSize.width < 800
            ? AppBar(
                iconTheme: const IconThemeData(color: Colors.blue),
                elevation: 0,
                backgroundColor: Colors.white.withOpacity(values.opacity),
                title: const Text(
                  'Author',
                  style: TextStyle(
                    color: Color(0xFF077bd7),
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
                centerTitle: true,
              )
            : PreferredSize(
                preferredSize: Size(
                  screenSize.width,
                  70,
                ),
                child: TopBarContents(opacity: values.opacity),
              ),
        body: SingleChildScrollView(
          controller: values.scrollController,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    child: SizedBox(
                      height: screenSize.height * 0.65,
                      width: screenSize.width,
                      child: Image.asset(
                        'assets/background.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      FloatingQuickAccessBar(screenSize: screenSize),
                      FeatureHeading(screenSize: screenSize),
                      FeaturedTiles(screenSize: screenSize),
                      MainHeading(screenSize: screenSize),
                      const MainCarousal(),
                      SizedBox(height: screenSize.height / 10),
                      const BottomBar(),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
