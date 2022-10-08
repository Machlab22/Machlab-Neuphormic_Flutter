import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'signin_page.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff212426),
      appBar: AppBar(
        backgroundColor: const Color(0xff212426),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Image(
            width: 24,
            color: Color(0xf9d3b488),
            image: Svg('assets/images/back_arrow.svg'),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          key: _formkey,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                // fontStyle: FontStyle.italic,
                                color: Color(0xf9d3b488)),
                          ),
                          const SizedBox(
                            height: 120,
                          ),
                          const Text(
                            "Join us to get started.",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                // fontStyle: FontStyle.italic,
                                color: Color(0xf9d3b488)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Neumorphic(
                            style: NeumorphicStyle(
                              depth: -1.1,
                              intensity: 0.6,
                              lightSource: LightSource.topLeft,
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(1)),
                            ),
                            child: TextFormField(
                              controller: nameController,
                              enableInteractiveSelection: true,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  // icon: const Icon(Icons.person),
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Color(0xf9d3b488))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Neumorphic(
                            style: NeumorphicStyle(
                              depth: -1.1,
                              intensity: 0.6,
                              lightSource: LightSource.topLeft,
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(1)),
                            ),
                            child: TextFormField(
                              controller: contactController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  // icon: const Icon(Icons.mobile_friendly),
                                  hintText: 'Contact Number',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Color(0xf9d3b488))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Neumorphic(
                            style: NeumorphicStyle(
                              depth: -1.1,
                              intensity: 0.6,
                              lightSource: LightSource.topLeft,
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(1)),
                            ),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                hintText: 'Email Id',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Color(0xf9d3b488)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter valid email';
                                }
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);

                                if (!emailValid) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Neumorphic(
                            style: NeumorphicStyle(
                              depth: -1.1,
                              intensity: 0.6,
                              lightSource: LightSource.topLeft,
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(1)),
                            ),
                            child: TextFormField(style: color: Colors.white,
                              obscureText: true,
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  // icon: const Icon(Icons.person),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Color(0xf9d3b488))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return "Password must be at least 8 characters";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              // fontStyle: FontStyle.italic,
                              color: Color(0xf9d3b488)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()),
                            );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                // fontStyle: FontStyle.italic,
                                color: Color(0xf9d3b488)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      NeumorphicButton(
                        provideHapticFeedback: true,
                        style: const NeumorphicStyle(depth: 4, intensity: 0.3),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90, vertical: 15),
                        onPressed: () {
                          print(emailController.text);

                          RegistrationUser();
                        },
                        child:
                         const Text(
                          'Register',
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xf9d3b488),
                          ),
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future RegistrationUser() async {
    String name = nameController.text;
    String contact = contactController.text;
    String email = emailController.text;
    String password = passwordController.text;

    //send  data using http post to our php code
    http.Response response = await http.post(Uri.parse(
));
    // http.Response response = await http.post(Uri.parse('https://iotmachlab.000webhostapp.com/api/register/read_all.php'))  ;
    //getting response from php code, here
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['status'] == 'success') {
      Fluttertoast.showToast(
          msg: "Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.red,
          fontSize: 16.0);
    }

    if (kDebugMode) {
      print(data);
    }
  }
}
// void RegistrationUser()  async{
//   //json maping user entered details
//   Map mapeddate ={
//     'name':name.text,
//     'email':email.text,
//     'contact':contact.text,
//     'password':password.text
//   };
//   //send  data using http post to our php code
//   http.Response response = await http.get(Uri.parse('https://iotmachlab.000webhostapp.com/api/register/register.php?name=vishwajit&contact=9248274983&email=sdfsdf&password=sdffsfd'))  ;
//   // http.Response response = await http.post(Uri.parse('https://iotmachlab.000webhostapp.com/api/register/read_all.php'))  ;
//
//   //getting response from php code, here
//   var data = jsonDecode(response.body);
//   if (kDebugMode) {
//     print(data);
//   }
