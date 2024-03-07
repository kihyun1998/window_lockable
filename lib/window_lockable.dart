import 'window_lockable_platform_interface.dart';

class WindowLockable {
  Future<String?> getPlatformVersion() {
    return WindowLockablePlatform.instance.getPlatformVersion();
  }

  Future<bool> setWindowLock() {
    return WindowLockablePlatform.instance.setWindowLock();
  }

  Future<bool> setWindowUnlock() {
    return WindowLockablePlatform.instance.setWindowUnlock();
  }
}
