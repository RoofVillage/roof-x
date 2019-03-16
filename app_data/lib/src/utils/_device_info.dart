import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:service/index.dart';

class DeviceInfo {
  static Map<String, Object> _params;

  static Future<Map<String, Object>> get params async {
    if (_params != null) return _params;
    _params = await _lookup;
    return _params;
  }

  static Future<Map<String, Object>> get _lookup async {
    if (Platform.isIOS) {
      final ios = await DeviceInfoPlugin().iosInfo;
      return {
        Param.platform: 'ios',
        Param.systemName: ios.systemName,
        Param.systemVersion: ios.systemVersion,
        Param.name: ios.name,
        Param.model: ios.model,
        Param.localizedModel: ios.localizedModel,
        Param.identifierForVendor: ios.identifierForVendor,
        Param.utsName: ios.utsname,
        Param.isPhysicalDevice: ios.isPhysicalDevice
      };
    } else if (Platform.isAndroid) {
      final android = await DeviceInfoPlugin().androidInfo;
      return {
        Param.platform: 'android',
        Param.version: android.version,
        Param.board: android.board,
        Param.bootloader: android.bootloader,
        Param.brand: android.brand,
        Param.device: android.device,
        Param.display: android.display,
        Param.fingerprint: android.fingerprint,
        Param.hardware: android.hardware,
        Param.host: android.host,
        Param.id: android.id,
        Param.manufacturer: android.manufacturer,
        Param.model: android.model,
        Param.product: android.product,
        Param.supported32BitAbis: android.supported32BitAbis,
        Param.supported64BitAbis: android.supported64BitAbis,
        Param.supportedAbis: android.supportedAbis,
        Param.tags: android.tags,
        Param.type: android.type,
        Param.isPhysicalDevice: android.isPhysicalDevice,
        Param.androidId: android.androidId
      };
    } else if (Platform.isMacOS) {
      return {Param.platform: 'macos'};
    } else if (Platform.isWindows) {
      return {Param.platform: 'windows'};
    } else if (Platform.isLinux) {
      return {Param.platform: 'linux'};
    } else if (Platform.isFuchsia) {
      return {Param.platform: 'fuschia'};
    }
    return null;
  }
}
