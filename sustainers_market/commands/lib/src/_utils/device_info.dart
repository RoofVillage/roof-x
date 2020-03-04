import 'dart:io' show Platform;

import 'package:device_info/device_info.dart';

class DeviceInfo {
  final String os;
  final String version;
  final String hardware;
  final String manufacturer;
  final String id;

  DeviceInfo._internal({
    this.os,
    this.version,
    this.hardware,
    this.manufacturer,
    this.id,
  });

  static Future<DeviceInfo> read() async {
    if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;

      return DeviceInfo._internal(
        os: iosInfo.systemName,
        version: iosInfo.systemVersion,
        hardware: iosInfo.model,
        manufacturer: "Apple",
        id: iosInfo.identifierForVendor,
      );
    } else if (Platform.isAndroid) {
      final AndroidDeviceInfo androidDeviceInfo =
          await DeviceInfoPlugin().androidInfo;

      return DeviceInfo._internal(
        os: androidDeviceInfo.version.baseOS,
        version: androidDeviceInfo.version.release,
        hardware: androidDeviceInfo.device,
        manufacturer: androidDeviceInfo.manufacturer,
        id: androidDeviceInfo.id,
      );
    } else {
      print("Device info not available");

      return DeviceInfo._internal();
    }
  }

  Map<String, String> toMap() {
    return {
      "os": os,
      "version": version,
      "hardware": hardware,
      "manufacturer": manufacturer,
      "id": id
    };
  }
}
