import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/controllers/top_bar_controller.dart';
import 'package:web_sample/models/navbar_items_model.dart/nav_bar_items_model.dart';

class TopBarContents extends StatelessWidget {
  const TopBarContents({super.key, required this.opacity});
  final double opacity;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final topBarProvider =
        Provider.of<TopBarController>(context, listen: false);
    return Container(
      color: Colors.white.withOpacity(opacity),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenSize.width / 6),
                  const Text(
                    'Authorweb',
                    style: TextStyle(
                      color: Color.fromARGB(255, 224, 10, 10),
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(width: screenSize.width / 15),
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: itemsList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(width: screenSize.width / 8),
                          InkWell(
                            onHover: (value) {
                              value
                                  ? topBarProvider.hoverChange(index, true)
                                  : topBarProvider.hoverChange(index, false);
                            },
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  itemsList[index].name,
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Consumer<TopBarController>(
                                    builder: (context, values, _) {
                                  return Visibility(
                                    maintainAnimation: true,
                                    maintainState: true,
                                    maintainSize: true,
                                    visible: values.isHovering[index],
                                    child: Container(
                                      height: 2,
                                      width: 20,
                                      color: Colors.black,
                                    ),
                                  );
                                })
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
