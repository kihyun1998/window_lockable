#ifndef FLUTTER_PLUGIN_WINDOW_LOCKABLE_PLUGIN_H_
#define FLUTTER_PLUGIN_WINDOW_LOCKABLE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>




namespace window_lockable {

class WindowLockablePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  WindowLockablePlugin();

  virtual ~WindowLockablePlugin();

  // Disallow copy and assign.
  WindowLockablePlugin(const WindowLockablePlugin&) = delete;
  WindowLockablePlugin& operator=(const WindowLockablePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace window_lockable

#endif  // FLUTTER_PLUGIN_WINDOW_LOCKABLE_PLUGIN_H_
