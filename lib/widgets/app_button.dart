import 'package:Lukman/widgets/app_text2.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.size,
      this.isIcon = false,
      this.text,
      required this.color,
      required this.backgroundColor,
      this.icon,
      required this.borderColor})
      : super(key: key);
  final Color color;
  final String? text;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final bool isIcon;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
          border: Border.all(color: borderColor)),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
            child: Icon(
                icon,
                color: color,
              ),
          ),
    );
  }
}
