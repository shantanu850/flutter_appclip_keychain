import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_appclip_keychain_method_channel.dart';

abstract class FlutterAppclipKeychainPlatform extends PlatformInterface {
  FlutterAppclipKeychainPlatform() : super(token: _token);
  static final Object _token = Object();
  static FlutterAppclipKeychainPlatform _instance = MethodChannelFlutterAppclipKeychain();
  static FlutterAppclipKeychainPlatform get instance => _instance;
  static set instance(FlutterAppclipKeychainPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> write({required String key, required String value,String? suite}) {
    throw UnimplementedError('platformVersion() has not been implemented. Only IOS is Supported');
  }

  Future<String?> read({required String key,String? suite}) {
    throw UnimplementedError('platformVersion() has not been implemented. Only IOS is Supported');
  }

  Future<String?> uuid() {
    throw UnimplementedError('platformVersion() has not been implemented. Only IOS is Supported');
  }
}
