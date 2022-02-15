
import 'package:flutter/material.dart';
import 'package:lukman/widgets/app_text.dart';
import 'package:lukman/widgets/app_text2.dart';
import 'package:lukman/widgets/responsive_button.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Screen1> {
  List images = [
    "aniket-deole-M6XC789HLe8-unsplash.jpg",
    "tomasz-smal-_HJNQCoXVkU-unsplash.png",
    "v2osk-1Z2niiBPg5A-unsplash.png",
  ];
  List texts = [
    "moutains serves as means of income to the government if it is properly "
        "managed. people tends to visit the place, and by so doing government "
        "tends to generate more money from the ",
    "mountains also serve as source of income, such that some mineral resources"
        "like salt rock are gottten from some mountains",
    "Mountains also serve as means of defence during war, citizens run to "
        "to hide under some mountains or behind mountains to get protecion "
        "during war"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    images[index],
                  ),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppLargeText(
                            text: "Trips",
                          ),
                          const AppText(
                            text: "Mountain",
                            size: 30,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: AppText(
                              text: texts[index],
                              size: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ResponsiveButton(
                            width: 120,
                            goToNavPage: (){
                             goToNavBarPages(context);
                            }
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexdots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 8,
                            height: index == indexdots ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexdots
                                    ? Colors.blue
                                    : Colors.red.withOpacity(0.3)),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
