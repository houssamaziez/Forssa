import 'package:flutter/material.dart';
import 'package:forssa/screens/Screen_home.dart';
import 'package:forssa/screens/var.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Model/list_app.dart';
import '../controller/login_controller.dart';

class Stng extends StatefulWidget {
  const Stng({Key? key}) : super(key: key);

  @override
  State<Stng> createState() => _StngState();
}

GetStorage lng = GetStorage();
GetStorage wlaya = GetStorage();

class _StngState extends State<Stng> {
  final c = Get.put(Logincontroller());

  String _indext = "en";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: const Icon(
                  Icons.language_outlined,
                  color: Colors.red,
                ),
                title: Text('change the language'.tr),
                trailing: DropdownButton(
                  items: langage.map((String items) {
                    return DropdownMenuItem(
                      // value: items == "English" ? "en" : "ar",
                      value: ss(items),
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() async {
                      _indext = value.toString();
                      await lng.write("lng", value);
                      Get.updateLocale(Locale(_indext));
                    });
                  },
                  value: lng.read("lng") == null ? "English" : lng.read("lng"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: const Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                ),
                title: Text('change area'.tr),
                trailing: DropdownButton(
                  disabledHint: Container(),
                  items: wilayat.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // ignore: prefer_if_null_operators
                  value: wlaya.read("wlaya") == null
                      ? dropdownvalue
                      : wlaya.read("wlaya"),
                  onChanged: (value) {
                    setState(() {
                      dropdownvalue = value.toString();
                      wlaya.write("wlaya", value);
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.help,
                    color: Colors.red,
                  ),
                  title: Text('help'.tr),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.share,
                    color: Colors.red,
                  ),
                  title: Text('share App'.tr),
                ),
              ),
            ),
          ),
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
              child: Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Text('Logout'.tr),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> langage = ["English", " العربية", 'Française'];
ss(items) {
  if (items == 'English') {
    return 'en';
  }
  if (items == ' العربية') {
    return 'ar';
  }
  if (items == 'Française') {
    return 'fr';
  }
}
