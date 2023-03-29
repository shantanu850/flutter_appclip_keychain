import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_appclip_keychain/flutter_appclip_keychain.dart';
import 'package:flutter_appclip_keychain/flutter_appclip_keychain_platform_interface.dart';
import 'package:flutter_appclip_keychain/flutter_appclip_keychain_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAppclipKeychainPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAppclipKeychainPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAppclipKeychainPlatform initialPlatform = FlutterAppclipKeychainPlatform.instance;

  test('$MethodChannelFlutterAppclipKeychain is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAppclipKeychain>());
  });

  test('getPlatformVersion', () async {
    FlutterAppclipKeychain flutterAppclipKeychainPlugin = FlutterAppclipKeychain();
    MockFlutterAppclipKeychainPlatform fakePlatform = MockFlutterAppclipKeychainPlatform();
    FlutterAppclipKeychainPlatform.instance = fakePlatform;

    expect(await flutterAppclipKeychainPlugin.getPlatformVersion(), '42');
  });
}
