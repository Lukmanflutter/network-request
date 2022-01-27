import 'package:Lukman/widgets/app_text.dart';
import 'package:Lukman/widgets/app_text2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:   const <Widget>[
            FirstRow(),
           SizedBox(
              height: 20,
            ),
            SecondRow(),
            SizedBox(
              height: 20,
            ),
            ContainerStackWidget(),
            SizedBox(height: 20,),
            GirlContainer(),
            AppLargeText(text: "Area of Focus"),
            // Expanded(
            //   child: ListView.builder(
            //    itemBuilder: ( _ , i){
            //      return Row(
            //        children: [
            //
            //        ],
            //      );
            //    },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

//widget that holds the
class FirstRow extends StatelessWidget {
  const FirstRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppLargeText(
            text: "Training",
            size: 30,
            color: Colors.lightGreen,
          ),
          Expanded(child: Container()),
          const Icon(Icons.arrow_back_ios),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.home_filled),
          const SizedBox(
            width: 15,
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}

// widget that holds the secondRow
class SecondRow extends StatelessWidget {
  const SecondRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppLargeText(
          text: "Your Program",
          size: 20,
        ),
        Expanded(child: Container()),
        const Padding(
            padding: EdgeInsets.only(right: 10),
            child: AppText(
              size: 20,
              color: Colors.blue,
              text: "Details",
            )),
        const Icon(Icons.arrow_forward),
      ],
    );
  }
}

//widget that that holds the container properties

class ContainerStackWidget extends StatelessWidget {
  const ContainerStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.green, Colors.lightBlue]),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(80),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 10), blurRadius: 10, color: Colors.green)
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              color: Colors.white,
              text: "Next Workout",
              size: 18,
            ),
            const SizedBox(
              height: 5,
            ),
            const AppText(
              text: "Legs Toning",
              size: 22,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            const AppText(
              color: Colors.white,
              size: 22,
              text: "and Glutes Workout",
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.timer,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AppText(
                      text: "60 min",
                      color: Colors.white,
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(60) ,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(4, 8)
                      ),
                    ]
                  ),
                    child: const Icon(
                  Icons.play_circle_fill,
                  size: 60,
                  color: Colors.white,
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

//this widget holds the container that house the female picture

class GirlContainer extends StatelessWidget {
  const GirlContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children:<Widget> [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width ,
            decoration: const BoxDecoration(
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,offset: Offset(8,10),color: Colors.cyan,
                ),
                BoxShadow(
                  blurRadius: 10,offset: Offset(-1,-5 ),color: Colors.cyan,
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}

