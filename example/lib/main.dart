import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_appclip_keychain/flutter_appclip_keychain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final shit;
  const MyApp({this.shit});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterAppclipKeychainPlugin = FlutterAppclipKeychain(suite: "com.erk.labs");

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    _flutterAppclipKeychainPlugin.suite;
    _flutterAppclipKeychainPlugin.write(key: "key", value: "value");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
