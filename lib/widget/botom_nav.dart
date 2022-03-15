import 'package:flutter/material.dart';
import 'package:forssa/Model/list_app.dart';
import 'package:forssa/screens/var.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';

import '../screens/Screen_home.dart';
import '../screens/my_profile.dart';
import '../screens/screen_favort.dart';
import '../screens/screen_stg.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 2,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: MotionTabBar(
          initialSelectedTab: "Home".tr,
          useSafeArea: true, // default: true, apply safe area wrapper
          labels: [
            "Dashboard".tr,
            "favorite".tr,
            "Home".tr,
            "Profile".tr,
            "Settings".tr,
          ],
          icons: const [
            Icons.people_alt,
            Icons.favorite,
            Icons.home,
            Icons.person,
            Icons.settings,
          ],

          // optional badges, length must be same with labels
          badges: [
            // Default Motion Badge Widget
            const MotionBadgeWidget(
              textColor: Colors.white, // optional, default to Colors.white
              color: Colors.red, // optional, default to Colors.red
              size: 18, // optional, default to 18
            ),

            // custom badge Widget
            MotionBadgeWidget(
              text: listfavoriid.length.toString(),
              textColor: listfavoriid.isEmpty
                  ? Colors.transparent
                  : Colors.white, // optional, default to Colors.white
              color: listfavoriid.isEmpty
                  ? Colors.transparent
                  : Colors.red, // optional, default to Colors.red
              size: 18, // optional, default to 18
            ),

            // allow null
            null,
            const MotionBadgeWidget(
              isIndicator: true,
              color: Colors.red, // optional, default to Colors.red
              size: 5, // optional, default to 5,
              show: true, // true / false
            ),

            const MotionBadgeWidget(
              isIndicator: true,
              color: Colors.red, // optional, default to Colors.red
              size: 5, // optional, default to 5,
              show: true, // true / false
            ),
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Colors.blue[600],
          tabIconSize: 24.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: color2,
          tabIconSelectedColor: Colors.white,
          tabBarColor: const Color.fromARGB(255, 192, 192, 192),
          onTabItemSelected: (int value) {
            setState(() {
              _tabController!.index = value;
            });
          },
        ),
      ),
      body: TabBarView(
          physics:
              const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
          controller: _tabController,
          // ignore: prefer_const_literals_to_create_immutables
          children: listwidget),
    );
  }
}

var listwidget = const [
  Center(
    child: Text("vide"),
  ),
  Screenfavort(),
  ScreenHome(),
  MyProfile(),
  Stng(),
];
