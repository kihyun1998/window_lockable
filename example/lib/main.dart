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
  final _windowLockablePlugin = WindowLockable();
  String _msg = "waiting..";

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
