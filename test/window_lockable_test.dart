import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:window_lockable/window_lockable.dart';
import 'package:window_lockable/window_lockable_method_channel.dart';
import 'package:window_lockable/window_lockable_platform_interface.dart';

class MockWindowLockablePlatform
    with MockPlatformInterfaceMixin
    implements WindowLockablePlatform {
  @override
  Future<bool> setWindowLock() {
    return Future.value(false);
  }

  @override
  Future<bool> setWindowUnlock() {
    return Future.value(true);
  }
}

void main() {
  final WindowLockablePlatform initialPlatform =
      WindowLockablePlatform.instance;

  test('$MethodChannelWindowLockable is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWindowLockable>());
  });

  test('setWindowLock', () async {
    WindowLockable windowLockablePlugin = WindowLockable();
    MockWindowLockablePlatform fakePlatform = MockWindowLockablePlatform();
    WindowLockablePlatform.instance = fakePlatform;

    expect(await windowLockablePlugin.setWindowLock(), false);
  });

  test('setWindowUnlock', () async {
    WindowLockable windowLockablePlugin = WindowLockable();
    MockWindowLockablePlatform fakePlatform = MockWindowLockablePlatform();
    WindowLockablePlatform.instance = fakePlatform;

    expect(await windowLockablePlugin.setWindowUnlock(), true);
  });

  test('windowLock', () async {
    MockWindowLockablePlatform fakePlatform = MockWindowLockablePlatform();
    WindowLockablePlatform.instance = fakePlatform;
  });

  test('windowUnLock', () async {
    MockWindowLockablePlatform fakePlatform = MockWindowLockablePlatform();
    WindowLockablePlatform.instance = fakePlatform;
  });
}
