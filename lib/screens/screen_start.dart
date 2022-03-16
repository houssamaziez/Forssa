import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:forssa/screens/var.dart';
import 'package:get/get.dart';

import '../widget/botom_nav.dart';
import '../widget/trd.dart';

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
    Timer(const Duration(seconds: 4), () {
      if (user.read("id") == null) {
        Get.off(OnBoardingPage());
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
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Image.asset(
                "images/forssalogo.png",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
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
            SpinKitPulse(
              color: color2,
            ),
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
