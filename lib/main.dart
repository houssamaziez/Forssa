import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forssa/Model/Languages/localizationService.dart';
import 'package:forssa/Model/list_app.dart';
import 'package:forssa/screens/my_profile.dart';
import 'package:forssa/screens/screen_start.dart';
import 'package:forssa/screens/screen_stg.dart';
import 'package:forssa/widget/botom_nav.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  listfavori = await listfavorstorageg.read("listfavori");
  listfavoriid = await listfavorstorageg.read("listid");
  if (listskillstorageg.read("skills") != null) {
    listskills = await listskillstorageg.read("skills");
  }
  // lng.remove("lng");
  print(lng.read("lng"));
  if (lng.read("lng") != null) {
    Get.updateLocale(Locale(lng.read("lng")));
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ScreenStart(),
      translations: LocalizationService(),
      // lang stundar li fi app
      fallbackLocale: const Locale("English"),
    );
  }
}
