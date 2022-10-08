// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../config/size_config.dart';
// import '../provider/base_view.dart';
// import '../src/screens/edit_profile/edit_profile.dart';
// import '../src/screens/favourites_screen/favourites_screen.dart';
// import '../src/screens/home_screen/components/dark_container.dart';
// import '../src/screens/home_screen/components/savings_container.dart';
// import '../src/screens/home_screen/components/weather_container.dart';
// import '../src/screens/menu_page/menu_screen.dart';
// import '../src/widgets/custom_bottom_nav_bar.dart';
// import '../view/home_screen_view_model.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../src/screens/home_screen/components/body.dart';
// import 'package:flutter_svg/svg.dart';
//
// class HomeScreen extends StatefulWidget {
//   static String routeName = '/home-screen';
//
//   HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final String iconAsset = "assets/icons/svg/light.svg";
//
//   // final VoidCallback onTap;
//   final String device = 'Living Room Light';
//   final String deviceCount = '5';
//   final bool itsOn = false;
//
//   // final VoidCallback switchButton;
//   final bool isFav = true;
//
//   // final VoidCallback switchFav;
//    bool value = false;
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     // return BaseView<HomeScreenViewModel>(
//     //     // onModelReady: (model) => {
//     //     //   model.generateRandomNumber(),
//     //     // },
//     //     builder: (context, model, child) {
//     return DefaultTabController(
//       length: 1,
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           backgroundColor: Colors.black12,
//           toolbarHeight: getProportionateScreenHeight(60),
//           elevation: 0,
//           iconTheme: const IconThemeData(color: Colors.black),
//           title: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: getProportionateScreenWidth(
//                 4,
//               ),
//             ),
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Hi, Lex',
//                   // style: Theme.of(context).textTheme.headline1,
//                 ),
//                 const SizedBox(
//                   width: 130,
//                   // getProportionateScreenWidth(60),
//                 ),
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: const BoxDecoration(
//                     color: Color(0xffdadada),
//                     borderRadius: BorderRadius.all(Radius.elliptical(45, 45)),
//                   ),
//                   child: IconButton(
//                     splashRadius: 25,
//                     icon: const Icon(
//                       FontAwesomeIcons.solidUser,
//                       color: Colors.amber,
//                     ),
//                     onPressed: () {
//                       // Navigator.of(context).pushNamed(EditProfile.routeName);
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) => const EditProfile(),
//                       //     ));
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   width: getProportionateScreenWidth(15),
//                 ),
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: const BoxDecoration(
//                     color: Color(0xffdadada),
//                     borderRadius: BorderRadius.all(Radius.elliptical(45, 45)),
//                   ),
//                   child: IconButton(
//                     splashRadius: 25,
//                     icon: const Icon(
//                       CupertinoIcons.heart_fill,
//                       color: Colors.grey,
//                       size: 30,
//                     ),
//                     onPressed: () {
//                       // Navigator.of(context).pushNamed(EditProfile.routeName);
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) => Favourites(
//                       //         model: model,
//                       //       ),
//                       //     ));
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(
//               20,
//               // getProportionateScreenHeight(
//               //   25,
//               // ),
//             ),
//             child: TabBar(
//                 isScrollable: true,
//                 unselectedLabelColor: Colors.blue.withOpacity(0.3),
//                 indicatorColor: const Color(0xFFFFFFFF),
//                 tabs: const [
//                   Tab(
//                     child: Text(
//                       'Living Room',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   // Tab(
//                   //   child: Text(
//                   //     'Dining',
//                   // style: Theme.of(context).textTheme.headline4,
//                   //   ),
//                   // ),
//                   // Tab(
//                   //   child: Text(
//                   //     'Kitchen',
//                   //     // style: Theme.of(context).textTheme.headline4,
//                   //   ),
//                   // ),
//                 ]),
//           ),
//         ),
//         drawer: SizedBox(
//             width: getProportionateScreenWidth(270), child: const Menu()),
//         body: TabBarView(
//           children: [
//             Container(
//               width: getProportionateScreenWidth(10),
//               height: getProportionateScreenHeight(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color:
//                     // const Color.fromRGBO(10, 0, 0, 1),
//                     const Color(0x000000ae),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: getProportionateScreenWidth(40),
//                   vertical: getProportionateScreenHeight(50),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: 70,
//                           height: 70,
//                           decoration: const BoxDecoration(
//                             color:
//                                 // Color.fromRGBO(45, 45, 45, 1),
//                                 Color(0xffffffff),
//                             borderRadius:
//                                 BorderRadius.all(Radius.elliptical(45, 45)),
//                           ),
//                           child: SvgPicture.asset(
//                             "assets/icons/svg/light.svg",
//                             color: Colors.yellow,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             itsOn == true;
//                             print('lamp icon itsOn true');
//                           },
//                           child: Icon(
//                             Icons.star_rounded,
//                             color:
//                                 isFav ? Colors.amber : const Color(0xFF808080),
//                             // color: Color(0xFF808080),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           device,
//                           textAlign: TextAlign.left,
//                           style: const TextStyle(
//                               color: Color.fromRGBO(166, 166, 166, 100),
//                               fontSize: 20,
//                               letterSpacing: 3,
//                               fontWeight: FontWeight.bold,
//                               height: 3),
//
//                         ),
//
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//
//                         Switch.adaptive(
//                             value: value,
//                             activeColor: Colors.white,
//                             inactiveThumbColor: Colors.white,
//                             inactiveTrackColor: Colors.white,
//                             onChanged: (value) {
//                               setState(() async {
//                                 this.value = value;
//                                 if(value){
//                                   print(value);
//                                   var url = Uri.parse(
//                                       'https://iotmachlab.000webhostapp.com/api/LED_1/update.php?id=1&status=$value');
//                                   http.Response response = await http.get(url);
//                                   var data = jsonDecode(response.body);
//                                   print(data);
//                                 }
//                               });
//                             })
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//         // bottomNavigationBar: CustomBottomNavBar(model: model),
//       ),
//     );
//   }
// }
// // }
