import 'package:flutter/material.dart';
import 'package:lukman/nav_pages/sign_in_page.dart';

import 'bar_item.dart';
import 'home.dart';
import 'my_page.dart';

class MyNavPge extends StatefulWidget {
  const MyNavPge({Key? key}) : super(key: key);

  @override
  _MyNavPgeState createState() => _MyNavPgeState();
}

class _MyNavPgeState extends State<MyNavPge> {
  final List pages = const [
    Home(),
    BarItemPage(),
    SignIn(),
    MyPage(),
  ];
  int currentIndex = 0;

  get index => currentIndex;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTap,
        elevation: 0,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              label: ("Home"), icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(
              label: ("Search"), icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              label:("personal"), icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
