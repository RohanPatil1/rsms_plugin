import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsms_plugin/rsms_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('rsms_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await RsmsPlugin.platformVersion, '42');
  });
}
