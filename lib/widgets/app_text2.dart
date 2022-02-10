import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({Key? key, this.text, this.color, this.size=16,})
      : super(key: key);
  final String? text;
  final double? size;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color,
          fontSize: size,
        fontFamily: "Comforter-Regular",
      ),
    );
  }
}
