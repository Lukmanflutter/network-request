import 'package:flutter/material.dart';
import 'package:lukman/widgets/app_button.dart';
import 'package:lukman/widgets/app_text.dart';
import 'package:lukman/widgets/app_text2.dart';

class BarItemPage extends StatefulWidget {
  const BarItemPage({Key? key}) : super(key: key);

  @override
  _BarDetailPageState createState() => _BarDetailPageState();
}

class _BarDetailPageState extends State<BarItemPage> {
  int starCount = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("tomasz-smal-_HJNQCoXVkU-unsplash.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: FirstRow(
                    firstIcon: Icons.menu,
                    secondIcon: Icons.arrow_forward,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: "Yosemite",
                            color: Colors.black.withOpacity(0.8),
                            size: 30,
                          ),
                          const AppLargeText(
                            text: "\$ 250",
                            size: 30,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_location,
                            color: Colors.blue.withOpacity(0.8),
                          ),
                          const AppText(
                            text: "USA, California",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: index < starCount
                                          ? Colors.yellow
                                          : Colors.black,
                                    )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const AppText(
                            color: Colors.black,
                            text: "(4.0)",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const AppLargeText(
                        text: "People",
                        size: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const AppText(
                        text: "Number Of People In your group",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: AppButton(
                                  text: "${index + 1}".toString(),
                                  size: 50,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.blueGrey,
                                  borderColor: selectedIndex == index
                                      ? Colors.blueAccent
                                      : Colors.blueAccent),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        size: 16,
                        color: Colors.black.withOpacity(0.6),
                        text: "Yesomite National Park is located in central "
                            "Sierra Nevada in the US state of California. it "
                            "is located near the wild protected areas",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// widget that holds the icon button at the top of the screen
class FirstRow extends StatelessWidget {
  const FirstRow({Key? key, required this.firstIcon, required this.secondIcon})
      : super(key: key);
  final IconData firstIcon;
  final IconData secondIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(firstIcon),
        Icon(secondIcon),
      ],
    );
  }
}
