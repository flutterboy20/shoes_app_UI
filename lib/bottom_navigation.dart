import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:shoes_app_ui_design_1/home-screen.dart';
import 'package:shoes_app_ui_design_1/search-screen.dart';

import 'account-screen.dart';

class BottomNav extends StatefulWidget {
  static const routeName = 'tab-bar-screen';
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  List page = [
    HomeScreen(),
    SearchScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            page[_currentIndex],
            Positioned(
              top: MediaQuery.of(context).size.height * 0.86,
              left: MediaQuery.of(context).size.width * 0.005,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 60,
                  width: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BottomNavyBar(
                      selectedIndex: _currentIndex,
                      onItemSelected: (index) {
                        setState(() => _currentIndex = index);
                      },
                      backgroundColor: Colors.black,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      items: [
                        BottomNavyBarItem(
                          title: Text('Home'),
                          icon: Icon(
                            Icons.home_filled,
                            color: Colors.white,
                            size: 25,
                          ),
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                        ),
                        BottomNavyBarItem(
                          title: Text('Explore'),
                          icon: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                        ),
                        BottomNavyBarItem(
                          title: Text('Search'),
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 25,
                          ),
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
