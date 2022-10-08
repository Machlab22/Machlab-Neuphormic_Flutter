import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:neophormic_flutter/main.dart';
import 'package:neophormic_flutter/register_page.dart';
import 'package:neophormic_flutter/signin_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: const NeumorphicThemeData(
        baseColor: Color(0xff212426),
        lightSource: LightSource.topLeft,
        depth: 1,
      ),
      darkTheme: const NeumorphicThemeData(
        intensity: 0.4,
        shadowDarkColor: Colors.black12,
        baseColor: Color(0xff212426),
        lightSource: LightSource.topLeft,
        depth: 1,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key}) : super();

  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: NeumorphicFloatingActionButton(
      //   style: ,
      //   child: const Icon(Icons.add, size: 30),
      //   onPressed: () {},
      // ),
      backgroundColor: const Color(0xff212426),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Image(
                          alignment: Alignment.center,
                          image: AssetImage('assets/images/iot-devices.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Hindustan Smart Automations",
                      textAlign: TextAlign.start,
                      textScaleFactor: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Color(0xf9d3b488)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                          builder: (context) => const RegisterPage()),);
                          print("onClick");

                        },
                        style: NeumorphicStyle(
                          depth: 9,
                          intensity: 0.3,
                          surfaceIntensity: 9,
                          lightSource: LightSource.topLeft,
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(10)),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: const Text(
                          "Register",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: Color(0xf9d3b488)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: NeumorphicButton(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()),
                          );
                          print("onClick");
                        },
                        style: NeumorphicStyle(
                          depth: 9,
                          intensity: 0.3,
                          lightSource: LightSource.topLeft,
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(10)),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: const Text(
                          "Sign in",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: Color(0xf9d3b488)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color? _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    // if (theme?.isUsingDark) {
    //   return theme?.current?.accentColor;
    // } else {
    //   return null;
    // }
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
