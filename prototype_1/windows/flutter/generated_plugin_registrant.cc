//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"


void RegisterPlugins(flutter::PluginRegistry* registry) {
#include <firebase_core/firebase_core_plugin_c_api.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FirebaseCorePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FirebaseCorePluginCApi"));
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
}
