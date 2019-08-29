import 'dart:async';

import 'package:flutter/services.dart';

class RsmsPlugin {
  static const MethodChannel _channel =
      const MethodChannel('rsms_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  static Future<Null> sendSMS(String phoneNumber, String msg) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("phoneNumber", () => phoneNumber);
    args.putIfAbsent("msg", () => msg);
    await _channel.invokeMethod('sendSMS', args);
    return null;
  }

}
