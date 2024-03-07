import 'package:window_lockable/window_lockable_platform_interface.dart';

class WindowLockable {
  Future<bool> setWindowLock() {
    return WindowLockablePlatform.instance.setWindowLock();
  }

  Future<bool> setWindowUnlock() {
    return WindowLockablePlatform.instance.setWindowUnlock();
  }
}
