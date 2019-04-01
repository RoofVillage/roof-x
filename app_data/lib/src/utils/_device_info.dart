import 'dart:async';
import 'dart:io';
import 'package:device_info/device_info.dart';

import '../_param.dart' as _param;

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
        _param.platform: 'ios',
        _param.systemName: ios.systemName,
        _param.systemVersion: ios.systemVersion,
        _param.name: ios.name,
        _param.model: ios.model,
        _param.localizedModel: ios.localizedModel,
        _param.identifierForVendor: ios.identifierForVendor,
        _param.utsName: ios.utsname,
        _param.isPhysicalDevice: ios.isPhysicalDevice
      };
    } else if (Platform.isAndroid) {
      final android = await DeviceInfoPlugin().androidInfo;
      return {
        _param.platform: 'android',
        _param.version: android.version,
        _param.board: android.board,
        _param.bootloader: android.bootloader,
        _param.brand: android.brand,
        _param.device: android.device,
        _param.display: android.display,
        _param.fingerprint: android.fingerprint,
        _param.hardware: android.hardware,
        _param.host: android.host,
        _param.id: android.id,
        _param.manufacturer: android.manufacturer,
        _param.model: android.model,
        _param.product: android.product,
        _param.supported32BitAbis: android.supported32BitAbis,
        _param.supported64BitAbis: android.supported64BitAbis,
        _param.supportedAbis: android.supportedAbis,
        _param.tags: android.tags,
        _param.type: android.type,
        _param.isPhysicalDevice: android.isPhysicalDevice,
        _param.androidId: android.androidId
      };
    } else if (Platform.isMacOS) {
      return {_param.platform: 'macos'};
    } else if (Platform.isWindows) {
      return {_param.platform: 'windows'};
    } else if (Platform.isLinux) {
      return {_param.platform: 'linux'};
    } else if (Platform.isFuchsia) {
      return {_param.platform: 'fuschia'};
    }
    return null;
  }
}
