import 'package:blossm_command/index.dart';
import 'package:commands/src/utils/token_storer.dart';

abstract class CommandDomain {
  String get domain;
  String get baseUrl;

  final TokenStore tokenStore = RoofTokenStore();
}
