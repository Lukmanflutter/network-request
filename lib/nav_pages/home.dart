import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lukman/widgets/app_text.dart';
import 'package:lukman/widgets/app_text2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    Map images = <dynamic, dynamic>{
      "image1.jpg": "image1",
      "image2.jpg": "image2",
      "image3.jpg": "image3",
      "image4.jpg": "image4",
      "image5.jpg": "image5",
      "image6.jpg": "image6",
      "image7.jpg": "image7",
      "image8.jpg": "image8",
      "image9.jpg": "image9",
    };
    List itemBuilderTracking = List.generate(50, (index) {
    var colors =Random().nextInt(16777215)+4278190080;
      return Color(colors);
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Column(
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
                  //alignment: Alignment.centerLeft,
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
                      child: AppText(text: 'Places',),
                      ),
                      Tab(
                        child: AppText(text: "Inspirations",size: 16,),
                      ),
                      Tab(
                        child: AppText(text: "Emotions",),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 250,
                    width: 300,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                              itemCount: 50,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: itemBuilderTracking[index],
                                  ),
                                );
                              }),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.cyan,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    AppLargeText(
                      text: "Explore more",
                      size: 22,
                    ),
                    AppText(
                      text: "See more",
                      color: Colors.blueGrey,
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              right: 5,
                            ),
                            width: 80,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                    images.keys.elementAt(index),
                                  ),
                                  fit:BoxFit.cover
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: AppText(
                              text: images.values.elementAt(index),
                              size: 16,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
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


