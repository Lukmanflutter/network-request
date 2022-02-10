import 'package:flutter/cupertino.dart';

class AppLargeText extends StatelessWidget {
  const AppLargeText({Key? key,  required this.text, this.color, this.size=16,})
      : super(key: key);
  final String text;
  final double? size;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color,
      fontSize: size,
          fontWeight: FontWeight.bold,
        fontFamily:"Comforter-Regular",
      ),
    );
  }
}

//this widget is to make sure that imageText is having different test color
class ImgTextColor {
  ImgTextColor({required this.text,this.color});
 final String? text;
 final Color? color;
}

