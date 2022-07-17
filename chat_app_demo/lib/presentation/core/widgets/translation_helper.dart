import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

// stful 要避免直接叫tr
// 為了簡短寫法
extension TranslationHelper on StatelessWidget { // 或者用Widget
  String tr(BuildContext context, String key) {
    return FlutterI18n.translate(context, key);
  }
}

