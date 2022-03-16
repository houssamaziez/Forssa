// import 'package:flutter/material.dart';
// import 'package:forssa/controller/login_controller.dart';
// import 'package:forssa/screens/screen_favort.dart';
// import 'package:forssa/screens/var.dart';
// import 'package:forssa/widget/drawer.dart';
// import 'package:get/get.dart';

// import 'Screen_home.dart';
// import 'my_profile.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int _currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     final c = Get.put(Logincontroller());
//     final GlobalKey<ScaffoldState> _key = GlobalKey();
//     return SafeArea(
//       child: Scaffold(
//         key: _key,
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             _currentIndex == 0 ? "Job requests" : "",
//             style: const TextStyle(color: Colors.black),
//           ),
//           leading: IconButton(
//               onPressed: () {
//                 _key.currentState?.openDrawer();
//               },
//               icon: const Icon(
//                 Icons.menu,
//                 color: Colors.black,
//               )),
//           backgroundColor: Colors.white,
//           elevation: 0,
//         ),
//         drawer: MyDrawer(c: c),
//         body: listwidget[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: color2,
//           elevation: 1,
//           unselectedItemColor: Colors.black,
//           showSelectedLabels: false,
//           selectedFontSize: 14,
//           currentIndex: _currentIndex,
//           unselectedFontSize: 10,
//           onTap: (value) {
//             setState(() => _currentIndex = value);
//           },
//           items: const [
//             BottomNavigationBarItem(
//               label: 'Home',
//               icon: Icon(
//                 Icons.home,
//               ),
//             ),
//             BottomNavigationBarItem(
//               label: 'Home',
//               icon: Icon(Icons.favorite),
//             ),
//             BottomNavigationBarItem(
//               label: 'Profile',
//               icon: Icon(Icons.person),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// var listwidget = const [
//   ScreenHome(),
//   Screenfavort(),
//   MyProfile(),
// ];
