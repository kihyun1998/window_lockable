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

  /// You can use easily window lock function
  /// But no return.
  final _windowLockableFunction = WindowLockableFunction();
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
          title: const Text('Window Lockable Example'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: setWindowLock,
                  child: const Text("Lock with return bool")),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: setWindowUnLock,
                  child: const Text("Unlock with return bool")),
              const SizedBox(height: 30),
              Text(_msg),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: _windowLockableFunction.windowLock,
                  child: const Text("Lock with no return")),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: _windowLockableFunction.windowUnLock,
                  child: const Text("Unlock with no return")),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
