import 'package:get/get.dart';

import 'lang_ar.dart';
import 'lang_en.dart';

class TranslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'ar': arabic,
      };
}
