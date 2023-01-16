import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/controllers/bottom_controller.dart';
import 'package:web_sample/controllers/drawer_controller.dart';
import 'package:web_sample/controllers/featured_tiles_controller.dart';
import 'package:web_sample/controllers/floatingquick_controller.dart';
import 'package:web_sample/controllers/home_controller.dart';
import 'package:web_sample/controllers/main_carousal_controller.dart';
import 'package:web_sample/controllers/responsive_controller.dart';
import 'package:web_sample/controllers/top_bar_controller.dart';
import 'package:web_sample/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => TopBarController()),
        ChangeNotifierProvider(create: (context) => FloatingQuickController()),
        ChangeNotifierProvider(create: (context) => ResponsiveController()),
        ChangeNotifierProvider(create: (context) => FeaturedTileController()),
        ChangeNotifierProvider(create: (context) => BottomController()),
        ChangeNotifierProvider(create: (context) => MainCarousalController()),
        ChangeNotifierProvider(create: (context) => MenuDrawerController()),
      ],
      child: MaterialApp(
        title: 'Flutter Web',
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
