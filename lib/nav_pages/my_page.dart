import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lukman/model/api_call.dart';
import 'package:lukman/widgets/app_text.dart';
import 'package:lukman/widgets/app_text2.dart';
import 'package:http/http.dart' as http;

// class that holds the widget tree
class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List info=[];
  // _initData(){
  //   DefaultAssetBundle.of(context).loadString("model/info.json").then((value){
  //    info= json.decode(value);
  //   });
  // }
  // void iniState(){
  //   super.initState();
  //   _initData();
  // }
  late Future<StudentModel> studentModel;
  @override
  void initState(){
    super.initState();
    studentModel=getStudent();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          shrinkWrap: true,
          children:  [
             const FirstRow(),
            const SizedBox(
              height: 20,
            ),
            const SecondRow(),
            const SizedBox(
              height: 20,
            ),
            const ContainerStackWidget(),
            const SizedBox(height: 20,),
            const GirlContainer(),
            const AppLargeText(text: "Area of Focus"),

            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: ( _ , i){
                  return Row(
                    children:  [
                      Container(
                        padding:const EdgeInsets.only(bottom: 10),
                        height: 200,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image:AssetImage("image4.jpg"),
                            ),
                          boxShadow:  [
                            BoxShadow(blurRadius: 3,offset: const Offset(5,5),
                            color: Colors.grey.withOpacity(0.1)),
                            BoxShadow(blurRadius: 3,offset: const Offset(-5,-5),
                                color: Colors.grey.withOpacity(0.1)),
                          ]
                        ),
                        child: const Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: AppText(
                                text: "glues",),
                            )),
                      )
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20,),
            const HttpContainer()

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
                ),
                ),
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
    return SizedBox(
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



//am using this container to track http request 

class HttpContainer extends StatefulWidget {
  const HttpContainer({Key? key}) : super(key: key);

  @override
  State<HttpContainer> createState() => _HttpContainerState();
}

class _HttpContainerState extends State<HttpContainer> {
  late Future<StudentModel> studentModel;
  @override
  void initState(){
    super.initState();
    studentModel=getStudent();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StudentModel>(
      future: getStudent(),
      builder: (context , snapshot){
        if (snapshot.hasData){
          StudentModel student = snapshot.data!;
          return AppLargeText(text:"userId: ${student.userId}\n"
              "id:${student.id}\n"
              "title: ${student.title}");
        }else if (snapshot.hasError){
          dynamic student = snapshot.error;
          return AppText(text: "$student".toString(),);
        }else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}



 Future <StudentModel> getStudent() async {
   const  urlRepo= "https://jsonplaceholder.typicode.com/albums/1";
   await Future.delayed(const Duration(seconds:5));
  final response= await http.get(Uri.parse(urlRepo));
  if(response.statusCode==200){
    final  jsonStudent =json.decode(response.body);
    print(jsonStudent);
    return StudentModel.fromJason(jsonStudent);
  }else {
    throw Exception("try again later plus  stay on the the platform");
  }

}







