import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_lockable/window_lockable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _windowLockablePlugin = WindowLockable();
  String _msg = "waiting..";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _windowLockablePlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> setWindowLock() async {
    try {
      final bool result = await _windowLockablePlugin.setWindowLock();
      setState(() {
        _msg = "Result is $result";
      });
    } on PlatformException catch (e) {
      print("Failed : ${e.message}");
    }
  }

  Future<void> setWindowUnLock() async {
    try {
      final bool result = await _windowLockablePlugin.setWindowUnlock();
      setState(() {
        _msg = "Result is $result";
      });
    } on PlatformException catch (e) {
      print("Failed : ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: setWindowLock, child: const Text("Lock")),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: setWindowUnLock, child: const Text("Unlock")),
              const SizedBox(height: 30),
              Text(_msg),
            ],
          ),
        ),
      ),
    );
  }
}
