import 'package:flutter/material.dart';
import 'package:forssa/controller/login_controller.dart';
import 'package:forssa/screens/var.dart';
import 'package:get/get.dart';

class Singin extends StatelessWidget {
  const Singin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(Logincontroller());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              c.loginstd();
            },
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.mail),
                title: Text("Login by google ${user.read("username")}"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
