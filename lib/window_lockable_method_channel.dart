import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'window_lockable_platform_interface.dart';

/// An implementation of [WindowLockablePlatform] that uses method channels.
class MethodChannelWindowLockable extends WindowLockablePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('window_lockable');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
