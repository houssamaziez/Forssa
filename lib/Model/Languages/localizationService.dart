import 'package:forssa/Model/Languages/ar.dart';
import 'package:forssa/Model/Languages/en.dart';
import 'package:forssa/Model/Languages/fr.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class LocalizationService extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "ar": ar,
        "fr": fr,
      };
}
