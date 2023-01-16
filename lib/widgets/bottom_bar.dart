import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/controllers/bottom_controller.dart';
import 'package:web_sample/widgets/bottom_bar_column.dart';
import 'package:web_sample/widgets/info_text.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBarController =
        Provider.of<BottomController>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(0),
        ),
        gradient: LinearGradient(
          colors: [
            bottomBarController.gradientStartColor,
            bottomBarController.gradientEndColor,
          ],
          begin: const FractionalOffset(0.2, 0.2),
          end: const FractionalOffset(1, 1),
          stops: const [0, 1],
          tileMode: TileMode.clamp,
        ),
      ),
      padding: const EdgeInsets.all(30),
      child: MediaQuery.of(context).size.width < 800
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'Youtube',
                    ),
                  ],
                ),
                const Divider(color: Colors.white),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InfoText(
                      text: 'authorweb@gmail.com',
                      type: 'Email',
                    ),
                    InfoText(
                      text: '128,Trymore Road, Delft, MN - 56124',
                      type: 'Address',
                    )
                  ],
                ),
                const Divider(color: Colors.white),
                const SizedBox(height: 20),
                const Text(
                  'Copyright @ 2023 | AuthorWeb',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    const BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    const BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'Youtube',
                    ),
                    Container(
                      color: Colors.white,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        InfoText(
                          text: 'authorweb@gmail.com',
                          type: 'Email',
                        ),
                        InfoText(
                          text: '128,Trymore Road, Delft, MN - 56124',
                          type: 'Address',
                        )
                      ],
                    )
                  ],
                ),
                const Divider(color: Colors.white),
                const SizedBox(height: 20),
                const Text(
                  'Copyright @ 2023 | AuthorWeb',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
    );
  }
}
