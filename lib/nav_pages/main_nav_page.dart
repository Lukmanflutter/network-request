import 'package:Lukman/nav_pages/bar_item.dart';
import 'package:Lukman/nav_pages/home.dart';
import 'package:Lukman/nav_pages/my_page.dart';
import 'package:Lukman/nav_pages/search_page.dart';
import 'package:flutter/material.dart';

class MyNavPge extends StatefulWidget {
  const MyNavPge({Key? key}) : super(key: key);


  @override
  _MyNavPgeState createState() => _MyNavPgeState();
}

class _MyNavPgeState extends State<MyNavPge> {
  final List pages =const[
    Home(),
    BarItemPage(),
    Search(),
    MyPage(),
  ];
  int currentIndex = 0;

  get index => currentIndex;
  void onTap(int index){
    setState(() {
      currentIndex= index;
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
        showSelectedLabels:false,
        showUnselectedLabels: false,
        onTap: onTap,
        elevation: 0,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(title:Text("Home"),icon: Icon(Icons.apps)),
          BottomNavigationBarItem(title:Text("Bar"),icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(title:Text("Search"),icon: Icon(Icons.search)),
          BottomNavigationBarItem(title:Text("Homw"),icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
