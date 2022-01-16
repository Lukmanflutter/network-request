import 'package:Lukman/widgets/app_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.menu, size: 30, color: Colors.black54),
                  const Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const AppLargeText(
              text: "Discover",
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                controller: _tabController,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    const CircleTabIndicator(color: Colors.red, radius: 4),
                tabs: const <Widget>[
                  Tab(
                    text: "Places",
                  ),
                  Tab(
                    text: "Inspirations",
                  ),
                  Tab(
                    text: "Emotions",
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: 200,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                  ),
                  Text("hi"),
                  Text("there"),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  const CircleTabIndicator({required this.color, required this.radius});
  final Color color;
  final double radius;
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  _CirclePainter({required this.color, required this.radius});
  final Color color;
  final double radius;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
