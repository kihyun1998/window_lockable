import 'package:flutter_test/flutter_test.dart';
import 'package:window_lockable/window_lockable.dart';
import 'package:window_lockable/window_lockable_platform_interface.dart';
import 'package:window_lockable/window_lockable_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWindowLockablePlatform
    with MockPlatformInterfaceMixin
    implements WindowLockablePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WindowLockablePlatform initialPlatform = WindowLockablePlatform.instance;

  test('$MethodChannelWindowLockable is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWindowLockable>());
  });

  test('getPlatformVersion', () async {
    WindowLockable windowLockablePlugin = WindowLockable();
    MockWindowLockablePlatform fakePlatform = MockWindowLockablePlatform();
    WindowLockablePlatform.instance = fakePlatform;

    expect(await windowLockablePlugin.getPlatformVersion(), '42');
  });
}
