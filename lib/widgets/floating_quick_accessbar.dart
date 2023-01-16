import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/controllers/floatingquick_controller.dart';
import 'package:web_sample/controllers/responsive_controller.dart';

class FloatingQuickAccessBar extends StatelessWidget {
  const FloatingQuickAccessBar({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final ResponsiveController responsiveController =
        Provider.of<ResponsiveController>(context, listen: false);
    final FloatingQuickController floatingQuickController =
        Provider.of<FloatingQuickController>(context, listen: false);
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.60,
          left: responsiveController.isSmallScreen(context)
              ? screenSize.width / 12
              : screenSize.width / 5,
          right: responsiveController.isSmallScreen(context)
              ? screenSize.width / 12
              : screenSize.width / 5,
        ),
        child: screenSize.width < 800
            ? Column(
                children: [
                  for (int i = 0; i < floatingQuickController.items.length; i++)
                    Consumer<FloatingQuickController>(
                      builder: (context, values, _) {
                        return Padding(
                          padding:
                              EdgeInsets.only(bottom: screenSize.height / 30),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 45,
                                bottom: screenSize.height / 45,
                                left: screenSize.width / 40,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    values.icons[i],
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(width: screenSize.width / 50),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onHover: (value) =>
                                        values.hoverChange(value, i),
                                    onTap: () {},
                                    child: Text(
                                      values.items[i],
                                      style: TextStyle(
                                          color: values.isHovering[i]
                                              ? Colors.blueGrey[900]
                                              : Colors.blueGrey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height / 50,
                    bottom: screenSize.height / 50,
                  ),
                  child: Consumer<FloatingQuickController>(
                      builder: (context, values, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: values.generateRowElements(screenSize),
                    );
                  }),
                ),
              ),
      ),
    );
  }
}
