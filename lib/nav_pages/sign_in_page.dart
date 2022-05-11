
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
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
  final GlobalKey<FormState> _key= GlobalKey();
  ShowUserInput x =ShowUserInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value){
                setState(() {
                  x.name=value;
                });

              },
              validator: _validation,
              controller: nameController,
              decoration:   InputDecoration(
                  labelText: "Name", border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0))),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              onChanged: (val){
                setState(() {
                  x.jobTitle=val;
                });
                },
              validator: _validationForjobInput,
              controller: jobController,
              decoration: const InputDecoration(
                  labelText: "Job title", border: OutlineInputBorder()),
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
                debugPrint(x.name);
                debugPrint(x.jobTitle);
                final _= _key.currentState!.validate();
                if ( _) {
                  final String name = nameController.text;
                  final String jobTittle = jobController.text;
                  final UserModel? user = await createUser(
                    name,
                    jobTittle,
                  );
                  setState(() {
                    _user=user;
                    nameController.text = "";
                    jobController.text = "";
                  });
                  Get.snackbar("success",
                      "the user ${_user?.name}and ${_user?.id} "
                          "and ${_user?.job}is created successfully at time${_user?.createdAt}'",
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds:2),
                      backgroundColor: Colors.blue);
                  debugPrint(ShowUserInput().name);
                  debugPrint(ShowUserInput().jobTitle);
                } else if(_user==null){
                  setState(() {
                    Get.snackbar('Name/Job', 'Both field is required');
                  });
                }

              },
              child: const Text("Sign in"),
            )
          ],
        ),
      ),
    );
  }



  String?  _validation( String? v){
    if (v == null || v.isEmpty){

      return "enter a valid input";
    }

  }
  String?  _validationForjobInput( String? v){
    if (v == null || v.isEmpty){
      return "enter correct input";
    }

  }

}

///this function is to make a post request to the back end
Future<UserModel?> createUser(String name, String jobTittle) async {
  const String apiUrl = "https://reqres.in/api/user";
  final response = await http
      .post(Uri.parse(apiUrl), body: {"name": name, "job": jobTittle});
  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

errorValidateMessage(String title, String message){
  Get.snackbar(title, message,
    backgroundColor: Colors.red,
    snackPosition:SnackPosition.BOTTOM,);
}
successValidateMessage(String title  , String message){
  Get.snackbar(title, message,
    backgroundColor: Colors.green,
    snackPosition:SnackPosition.BOTTOM,);
}

class ShowUserInput{
  ShowUserInput({this.name="",this.jobTitle=""});
  String name;
  String jobTitle;
}

