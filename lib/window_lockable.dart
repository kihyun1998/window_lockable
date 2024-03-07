
import 'window_lockable_platform_interface.dart';

class WindowLockable {
  Future<String?> getPlatformVersion() {
    return WindowLockablePlatform.instance.getPlatformVersion();
  }
}
