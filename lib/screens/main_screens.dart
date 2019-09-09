import 'package:cinema_flt/screens/home/home_screen.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Cinema'),
      // ),
      body: _pagesView[_selectedPage]['page'],
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
              icon: item['icon'], title: Text(item['title'])),
        );
      },
    );
    return navBarItems;
  }

  void _selectPage(int page) {
    setState(() {
      _selectedPage = page;
    });
  }
}
