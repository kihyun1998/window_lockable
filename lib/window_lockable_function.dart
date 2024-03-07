import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:window_lockable/window_lockable.dart';

class WindowLockableFunction {
  final _windowLockablePlugin = WindowLockable();

  Future<void> windowLock() async {
    try {
      await _windowLockablePlugin.setWindowLock();
    } on PlatformException catch (e) {
      log("Failed : ${e.message}");
    }
  }

  Future<void> windowUnLock() async {
    try {
      await _windowLockablePlugin.setWindowUnlock();
    } on PlatformException catch (e) {
      log("Failed : ${e.message}");
    }
  }
}
