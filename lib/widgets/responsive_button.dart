import 'package:flutter/material.dart';
import 'package:lukman/nav_pages/main_nav_page.dart';

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton(
      {Key? key, this.width, this.isResponsive, required this.goToNavPage})
      : super(key: key);
  final bool? isResponsive;
  final double? width;
  final void Function() goToNavPage;

  Color get color => Colors.blue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.arrow_forward,
              size: 16,
            ),
          ],
        ),
      ),
      onTap: goToNavPage,
    );
  }
}

void goToNavBarPages(BuildContext context) {
  final _route = MaterialPageRoute(builder: (context) {
    return  const MyNavPge();
  });
  Navigator.push(context, _route);
}
