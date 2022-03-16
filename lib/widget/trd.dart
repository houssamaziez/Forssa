import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forssa/screens/var.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../controller/login_controller.dart';
import '../screens/screen_start.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('images/$assetName', width: width);
  }

  final c = Get.put(Logincontroller());
  bool isleading = false;
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,

        globalFooter: SizedBox(
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    await c.loginstd();
                  },
                  color: Colors.white,
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          "images/gmail.png",
                          height: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Continue with google'.tr,
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
        pages: [
          // page 1
          PageViewModel(
            title: "Welcome to Forsa".tr,
            body:
                "Our app is unique, innovative Made for job search (part-time) for students and unemployed people"
                    .tr,
            image: _buildImage('img1.png'),
            decoration: pageDecoration,
          ),
          // page 2

          PageViewModel(
            title: "Its Features".tr,
            body:
                " By contracting with many stores and companies in all fields, we have provided you with very suitable discount offers"
                    .tr,
            image: _buildImage('Img3.png'),
            decoration: pageDecoration,
          ),
          // page 3
          PageViewModel(
            title: "Just...",
            body: "Record, share! You will enjoy because you downloaded it",
            image: _buildImage('img4.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => setState(() async {
          isleading = true;
          await c.loginstd();
          isleading = false;
        }),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: false,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        //rtl: true, // Display as right-to-left
        back: Icon(
          Icons.arrow_back,
          color: color2,
        ),
        next: Icon(
          Icons.arrow_forward,
          color: color2,
        ),
        done: Text('Done',
            style: TextStyle(fontWeight: FontWeight.w600, color: color2)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: DotsDecorator(
          size: const Size(10.0, 10.0),
          color: const Color(0xFFBDBDBD),
          activeColor: color2,
          activeSize: const Size(22.0, 10.0),
          activeShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
