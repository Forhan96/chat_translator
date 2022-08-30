import 'package:chat_translator/router/routes.dart';
import 'package:chat_translator/utils/color_const.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class DefaultNavBar extends StatelessWidget {
  // final Function onTap;
  final int initialActiveIndex;
  const DefaultNavBar({
    Key? key,
    required this.initialActiveIndex,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return ConvexAppBar(
      initialActiveIndex: initialActiveIndex,
      onTap: (int i) {
        // if (currentIndex == i) {
        //   print("$currentIndex--------------$i");
        //   return;
        // }
        // currentIndex = i;
        switch (i) {
          case 0:
            Navigator.pushNamed(context, Routes.HOME_SCREEN);
            break;
          case 1:
            Navigator.pushNamed(context, Routes.SEARCH_SCREEN);
            break;
          case 2:
            Navigator.pushNamed(context, Routes.PROFILE_SCREEN);
            break;
          default:
            print(i);
        }
      },
      // onTap: (int i) {
      //   onTap.call(i);
      // },
      backgroundColor: AppColors.primaryColor,
      style: TabStyle.textIn,
      items: [
        TabItem(
          icon: Icons.chat_rounded,
          title: "Messages",
        ),
        TabItem(
          icon: Icons.search,
          title: "Search",
        ),
        TabItem(
          icon: Icons.person_outline_rounded,
          title: "Profile",
        ),
      ],
    );
  }
}
