import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/provider/darktheme_provider.dart';
import 'package:grocery/screens/caregory.dart';

import 'package:grocery/screens/cart/cart_Screen.dart';
import 'package:grocery/screens/home_screen.dart';
import 'package:grocery/screens/users.dart';
import 'package:provider/provider.dart';
//import 'package:badges/badges.dart';

class BottomBar extends StatefulWidget {
  static const route ='/bottombar';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectScreen = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': "Home"},
    {'page':  Categories(), 'title': "Categories"},
    {'page': const CartScreen(), 'title': "cart"},
    {'page': const Users(), 'title': "user"},
  ];

  void _selectPage(int index) {
    setState(() {
      selectScreen = index;
    });
  }

  //accessing key value example is given below

  @override
  Widget build(BuildContext context) {
    final themeStatus = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      // appBar:AppBar(
      //   title: Text(_pages[selectScreen]['title'],),
      // ),
      body: _pages[selectScreen]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectScreen,
        
        onTap: _selectPage,
        backgroundColor: themeStatus.getDarkTheme
            ? Theme.of(context).cardColor
            : Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                selectScreen == 0 ? IconlyBold.home : IconlyLight.home,
                color: themeStatus.getDarkTheme ? Colors.white : Colors.blue,
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(
                selectScreen == 1 ? IconlyBold.category : IconlyLight.category,
                color: themeStatus.getDarkTheme ? Colors.white : Colors.blue,
              ),
              label: "categories"),
          BottomNavigationBarItem(
              icon: Icon(
                selectScreen == 2 ? IconlyBold.buy : IconlyLight.buy,
                color: themeStatus.getDarkTheme ? Colors.white : Colors.blue,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                selectScreen == 3 ? IconlyBold.user2 : IconlyLight.user2,
                color: themeStatus.getDarkTheme ? Colors.white : Colors.blue,
              ),
              label: "User"),
        ],
      ),
    );
  }
}
