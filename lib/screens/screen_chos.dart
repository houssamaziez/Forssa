import 'package:flutter/material.dart';
import 'package:forssa/controller/login_controller.dart';
import 'package:forssa/screens/var.dart';
import 'package:get/get.dart';

class Screenchos extends StatefulWidget {
  const Screenchos({Key? key}) : super(key: key);

  @override
  State<Screenchos> createState() => _ScreenchosState();
}

class _ScreenchosState extends State<Screenchos> {
  int chos = 1;
  @override
  Widget build(BuildContext context) {
    final c = Get.put(Logincontroller());

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.3,
        title: Text(
          "Who are you",
          style: TextStyle(
            color: color2,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  student
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      chos = 1;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Image.asset('images/student.png'),
                          height: chos == 1
                              ? MediaQuery.of(context).size.height * 0.4
                              : MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        chos == 1
                            ? InkWell(
                                onTap: () {
                                  c.loginstd();
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "images/gmail.png",
                                        height: 30,
                                      ),
                                    ),
                                    const Text(
                                      "Log in",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Student",
                            style: TextStyle(
                                color: color2,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //  company
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      chos = 0;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Image.asset('images/company.png'),
                          height: chos == 0
                              ? MediaQuery.of(context).size.height * 0.4
                              : MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        chos == 0
                            ? Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "images/gmail.png",
                                      height: 30,
                                    ),
                                  ),
                                  const Text(
                                    "Log in",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Company",
                            style: TextStyle(
                                color: color2,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
