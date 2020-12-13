// Bottom menu widget for Open Flutter E-commerce App
// Author: Appproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/app_settings.dart';
import '../../../config/routes.dart';

class AppBottomMenu extends StatelessWidget {
  final int menuIndex;

  AppBottomMenu(this.menuIndex);

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? theme.accentColor : theme.primaryColorLight;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        image,
        height: 24.0,
        width: 24.0,
        color: colorByIndex(theme, index),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 10.0,
          color: colorByIndex(theme, index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem('assets/icons/bottom_menu/home.svg', 'Home', _theme, 0),
      getItem('assets/icons/bottom_menu/cart.svg', 'Shop', _theme, 1),
      getItem('assets/icons/bottom_menu/bag.svg', 'Bag', _theme, 2),
      getItem('assets/icons/bottom_menu/favorites.svg', 'Favorites', _theme, 3),
    ];
    if (AppSettings.profileEnabled) {
      menuItems.add(getItem(
          'assets/icons/bottom_menu/profile.svg', 'Profile', _theme, 4));
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: menuIndex,
          onTap: (value) {
            switch (value) {
              case 0:
                Navigator.pushNamed(context, AppRoutes.home);
                break;
              case 4:
                Navigator.pushNamed(context, AppRoutes.profile);
                break;
            }
          },
          items: menuItems,
        ),
      ),
    );
  }
}
