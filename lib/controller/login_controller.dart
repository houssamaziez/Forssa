import 'package:forssa/screens/screen_chos.dart';
import 'package:forssa/screens/var.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widget/botom_nav.dart';

class Logincontroller extends GetxController {
  var isleading = false;
  GoogleSignIn googlesing = GoogleSignIn();
  loginstd() async {
    final usergogle = await googlesing.signIn();

    if (usergogle == null) {
      Get.snackbar("The internet is weak", "Check your internet and try again");
    } else {
      await user.write('username', usergogle.displayName);
      update();

      await user.write('email', usergogle.email);
      update();

      await user.write('id', usergogle.id);
      update();

      await user.write('image', usergogle.photoUrl);

      update();
      await user.write('isstdt', true);

      update();
      print("cbnnnnnnnnnnnnnnnnnnnnn");
      Get.off(() => MyHomePage());
    }
  }

  signOut() async {
    await googlesing.signOut();
    Get.offAll(() => const Screenchos());
  }
}
