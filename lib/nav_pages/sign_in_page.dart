
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lukman/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
 UserModel? _user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children:[
          TextField(
            controller: nameController,
              decoration: const InputDecoration(
             labelText: "Name",
                  border: OutlineInputBorder()
              ),
          ),
          const SizedBox(height: 20.0,),
          TextFormField(
            controller: jobController,
              decoration: const InputDecoration(
                labelText: "Job title",
                border: OutlineInputBorder()
              ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const SizedBox(
            height: 30.0,
          ),
         // _user == null
         //      ? Container():
          MaterialButton(
            onPressed: () async {
              final String name = nameController.text;
              final String jobTittle = jobController.text;
              final UserModel? user = await createUser(name, jobTittle, );
              setState(() {
                _user = user;
              });
              if (_user==null){
                return;
              }else{
                 // ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                 //    content: Text('the user ${_user?.name}and ${_user?.id}is created successfully at time')));
                // var v = Get.rawSnackbar( 'the user ${_user?.name}and ${_user?.id}is created successfully at time',
                //     snackPosition:SnackPosition.BOTTOM);
               Get.snackbar("",
                   "'the user ${_user?.name}and ${_user?.id} and ${_user?.job}is created successfully at time${_user?.createdAt}'",
               snackPosition: SnackPosition.BOTTOM,duration: const Duration(seconds: 5));
              }
            },
            child: const Text("Sign in"),
          )
        ],
      ),
    );
  }
}

///this is function is to make a post request to the back end
Future<UserModel?> createUser(String name, String jobTittle) async {
  const String apiUrl = "https://reqres.in/api/user";
  final response = await http
      .post(Uri.parse(apiUrl), body: {"name": name, "job": jobTittle}) ;
  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelFromJson(responseString);
  } else {
    return null ;
  }
}
