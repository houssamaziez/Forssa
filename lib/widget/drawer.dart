import 'package:flutter/material.dart';
import 'package:forssa/controller/login_controller.dart';
import 'package:forssa/screens/var.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.c,
  }) : super(key: key);

  final Logincontroller c;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "images/forrsacov.png",
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: const Card(
                child: ListTile(
                    title: Text('Home'),
                    leading: Icon(
                      Icons.home,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: const Card(
                child: ListTile(
                    title: Text('Profile'), leading: Icon(Icons.person)),
              ),
            ),
          ),
          const ListTile(
              leading: Icon(
            Icons.home,
          )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                c.signOut();
                user.remove("image");
                user.remove("username");
                user.remove("email");
                user.remove("id");
                user.remove("isstdt");
              },
              child: const Card(
                child: ListTile(
                    title: Text('Logout'),
                    leading: Icon(
                      Icons.exit_to_app,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
