import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:matrix_app/src/localization/string_hardcoded.dart';

class CustomToast {
  static const MethodChannel _channel =
      MethodChannel('com.matrix_app/custom_toast');

  static Future<void> show(String message) async {
    try {
      await _channel.invokeMethod('showToast', {'message': message});
    } catch (e) {
      debugPrint("Failed to invoke native toast: '$e'".hardcoded);
    }
  }
}
