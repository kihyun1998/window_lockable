import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'window_lockable_method_channel.dart';

abstract class WindowLockablePlatform extends PlatformInterface {
  /// Constructs a WindowLockablePlatform.
  WindowLockablePlatform() : super(token: _token);

  static final Object _token = Object();

  static WindowLockablePlatform _instance = MethodChannelWindowLockable();

  /// The default instance of [WindowLockablePlatform] to use.
  ///
  /// Defaults to [MethodChannelWindowLockable].
  static WindowLockablePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WindowLockablePlatform] when
  /// they register themselves.
  static set instance(WindowLockablePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> setWindowLock() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> setWindowUnlock() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
