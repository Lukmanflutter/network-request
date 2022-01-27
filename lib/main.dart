import 'package:flutter/material.dart';
import 'package:Lukman/screens/welcome_page/screen1.dart';
main(){
runApp(const myApp());
}
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Screen1(),
    );
  }
}
