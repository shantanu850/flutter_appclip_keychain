import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'flutter_appclip_keychain_platform_interface.dart';

class MethodChannelFlutterAppclipKeychain
    extends FlutterAppclipKeychainPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_appclip_keychain');
  @override
  Future<String?> write({
    required String key,
    required String value,
    String? suite,
  }) async {
    final String? version = await methodChannel.invokeMethod(
      'write',
      <String, dynamic>{
        'key': key,
        'value': value,
        'suite_name': suite,
      },
    );
    return version;
  }

  @override
  Future<String?> read({
    required String key,
    String? suite,
  }) async {
    return await methodChannel.invokeMethod(
      'read',
      <String, dynamic>{
        'key': key,
        'value': null,
        'suite_name': suite,
      },
    );
  }

  @override
  Future<String?> uuid() async {
    return await methodChannel.invokeMethod(
      'uuid',
      <String, dynamic>{
        'key': null,
        'value': null,
        'suite_name': null,
      },
    );
  }
}
