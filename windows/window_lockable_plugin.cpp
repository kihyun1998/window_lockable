#include "window_lockable_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <sstream>

using flutter::EncodableMap;
using flutter::EncodableValue;
// using flutter::MethodChannel;
// using flutter::MethodResult;

namespace window_lockable {

// static
void WindowLockablePlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "io.github.kihyun1998/window_lockable",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<WindowLockablePlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

WindowLockablePlugin::WindowLockablePlugin() {}

WindowLockablePlugin::~WindowLockablePlugin() {}

void WindowLockablePlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if(method_call.method_name().compare("setWindowSizeable") == 0){
    HWND hwnd = GetForegroundWindow();
    const auto* arguments = std::get_if<EncodableMap>(method_call.arguments());
    bool sizeable = std::get<bool>(arguments->at(EncodableValue("sizeable")));
    if (hwnd == NULL) {
      result->Error("NO_WINDOW", "No active window found");
      return;
    }
    if (sizeable) {
      SetWindowLong(hwnd, GWL_STYLE, GetWindowLong(hwnd, GWL_STYLE) | WS_SIZEBOX);
    } else {
      SetWindowLong(hwnd, GWL_STYLE, GetWindowLong(hwnd, GWL_STYLE) & ~WS_SIZEBOX);
    }
    result->Success(EncodableValue(sizeable));
  } else {
    result->NotImplemented();
  }
}

}  // namespace window_lockable
