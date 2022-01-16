import 'package:flutter/cupertino.dart';

class AppLargeText extends StatelessWidget {
  const AppLargeText({Key? key, this.text, this.color, this.size=30})
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
          fontWeight: FontWeight.bold
      ),
    );
  }
}
