import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_appclip_keychain/flutter_appclip_keychain_method_channel.dart';

void main() {
  MethodChannelFlutterAppclipKeychain platform = MethodChannelFlutterAppclipKeychain();
  const MethodChannel channel = MethodChannel('flutter_appclip_keychain');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
