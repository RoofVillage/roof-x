import 'package:flutter/material.dart';

import 'device_screen.dart';

mixin MultiScreenBuilder {
  Widget build(BuildContext context) {
    switch (DeviceScreen.of(context).current) {
      case DeviceScreenOption.small:
        return buildSmall(context);
      case DeviceScreenOption.medium:
        return buildMedium(context);
      case DeviceScreenOption.large:
        return buildLarge(context);
    }
    return null;
  }

  Widget buildLarge(BuildContext context) => buildMedium(context);
  Widget buildMedium(BuildContext context) => buildSmall(context);
  Widget buildSmall(BuildContext context) => null;
}
