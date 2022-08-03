import 'package:cinema_flt/screens/home/home_screen.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'tv/tv_screen.dart';

class MainScreens extends StatefulWidget {
  static const routeName = '/';

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  List<Map<String, Object>> _pagesView = [
    {'page': HomeScreen(), 'title': 'Home', 'icon': Icon(Icons.home)},
    {'page': TvScreen(), 'title': 'TV', 'icon': Icon(Icons.tv)}
  ];

  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            return Scaffold(
              backgroundColor: AppStyle.greyApp,
              body: Align(
                alignment: Alignment.center,
                child: Container(
                  width: DEKSTOP,
                  child: buildBody(),
                ),
              ),
            );
          case DeviceScreenType.tablet:
            return Scaffold(
              backgroundColor: AppStyle.greyApp,
              body: Align(
                alignment: Alignment.center,
                child: Container(
                  width: TABLET,
                  child: buildBody(),
                ),
              ),
            );
          default:
            return buildBody();
        }
      },
    );
  }

  Widget buildBody() {
    return Scaffold(
      body: IndexedStack(
        index: _selectedPage,
        children: _pagesView.map((t) => t['page'] as Widget).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getNavBarItems(),
        currentIndex: _selectedPage,
        onTap: _selectPage,
        backgroundColor: AppStyle.getColor(ThemeColor.secondary),
        selectedItemColor: AppStyle.getColor(ThemeColor.primary),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  List<BottomNavigationBarItem> _getNavBarItems() {
    List<BottomNavigationBarItem> navBarItems = [];
    _pagesView.forEach(
      (item) {
        navBarItems.add(
          BottomNavigationBarItem(
            icon: item['icon'] as Widget,
            label: item['title'] as String,
          ),
        );
      },
    );
    return navBarItems;
  }

  void _selectPage(int page) {
    setState(() => _selectedPage = page);
  }
}
