import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:window_lockable/window_lockable_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelWindowLockable platform = MethodChannelWindowLockable();
  const MethodChannel channel =
      MethodChannel('io.github.kihyun1998/window_lockable');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        if (methodCall.method == "setWindowSizeable") {
          return methodCall.arguments['sizeable'];
        }
        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('setWindowLock', () async {
    expect(await platform.setWindowLock(), false);
  });

  test('setWindowUnlock', () async {
    expect(await platform.setWindowUnlock(), true);
  });
}
