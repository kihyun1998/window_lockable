#include "include/window_lockable/window_lockable_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "window_lockable_plugin.h"

void WindowLockablePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  window_lockable::WindowLockablePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
