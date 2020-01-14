import 'package:commands/src/utils/device_info.dart';
import 'package:blossm_command/index.dart';
import 'package:commands/src/utils/index.dart';

class SessionCommands extends CommandDomain {
  @override
  String get domain => "session";

  @override
  String get baseUrl => coreStagingBaseUrl;

  Future start() async {
    final deviceInfo = await DeviceInfo.read();

    return BlossmCommand(
      payload: {
        "device": deviceInfo.toMap(),
      },
      route: "start",
      domain: domain,
      baseUrl: baseUrl,
      tokenStore: tokenStore,
    ).issue();
  }
}
