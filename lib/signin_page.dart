import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:neophormic_flutter/register_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        //to make page scrollable
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome back.",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              // fontStyle: FontStyle.italic,
                              color: Color(0xf9d3b488)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "You've been missed !",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xf9d3b488)),
                        ),
                        const SizedBox(
                          height: 80,
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
                            // obscureText: true,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),

                                // icon: const Icon(Icons.person),
                                hintText: 'Phone, email or username',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Color(0xf9d3b488))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              // if (value.length < 8) {
                              //   return "Password must be at least 8 characters";
                              // }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: -1.2,
                            intensity: 0.6,
                            lightSource: LightSource.topLeft,
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(1)),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
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
                        "Don't have an account? ",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xf9d3b488)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xf9d3b488),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    NeumorphicButton(
                      style:const NeumorphicStyle(
                        depth: 2,
                        intensity: 0.3,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                      onPressed: () {
                        print(emailController.text);

                        LoginUser();
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xf9d3b488),
                        ),
                      ),
                    ),
                  ])
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future LoginUser() async {
    String email = emailController.text;
    String password = passwordController.text;

    //send  data using http post to our php code
    http.Response response = await http.post(Uri.parse());
    //getting response from php code, here
    var data = jsonDecode(response.body);
    // print('success');
    if (response.statusCode == 200 && data['success'] == 1) {
      print('success1');
      Fluttertoast.showToast(
          msg: "Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
      home_screen();
    } else {
      print('NOt success');
    }
    if (kDebugMode) {
      print(data);
    }
  }

  void home_screen() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => HomeScreen()),
    // );
  }
}
