import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:forssa/screens/home.dart';
import 'package:forssa/screens/screen_chos.dart';
import 'package:forssa/screens/var.dart';
import 'package:get/get.dart';

import '../widget/botom_nav.dart';

class ScreenStart extends StatefulWidget {
  const ScreenStart({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenStart> createState() => _ScreenStartState();
}

class _ScreenStartState extends State<ScreenStart> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      if (user.read("id") == null) {
        Get.off(const Screenchos());
      } else {
        Get.off(MyHomePage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "images/forssalogo.png",
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Text(
              'Forssa',
              style: TextStyle(
                color: color2,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            spinkit,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

final spinkit = SpinKitSpinningLines(
  color: color2,
);
