import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'window_lockable_platform_interface.dart';

/// An implementation of [WindowLockablePlatform] that uses method channels.
class MethodChannelWindowLockable extends WindowLockablePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('io.github.kihyun1998/window_lockable');

  @override
  Future<bool> setWindowLock() async {
    final bool result = await methodChannel
        .invokeMethod('setWindowSizeable', {"sizeable": false});
    return result;
  }

  @override
  Future<bool> setWindowUnlock() async {
    final bool result = await methodChannel
        .invokeMethod('setWindowSizeable', {"sizeable": true});
    return result;
  }
}
