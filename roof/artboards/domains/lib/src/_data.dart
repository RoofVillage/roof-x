import 'dart:async';

mixin DomainsArtboardData {
  final data = Stream.value(
    LandlordProfilesView([
      LandlordProfile("Mills Rentals", 7),
      LandlordProfile("Dallas Crash Pads", null),
      LandlordProfile("GN Company", 2),
      LandlordProfile("Mills Rentals", 7),
      LandlordProfile("Dallas Crash Pads", null),
      LandlordProfile("GN Company", 2),
      LandlordProfile("Mills Rentals", 7),
      LandlordProfile("Dallas Crash Pads", null),
      LandlordProfile("GN Company", 2),
      LandlordProfile("Mills Rentals", 7),
      LandlordProfile("Dallas Crash Pads", null),
      LandlordProfile("GN Company", 2),
      LandlordProfile("Mills Rentals", 7),
      LandlordProfile("Dallas Crash Pads", null),
      LandlordProfile("GN Company", 2),
      LandlordProfile("Mills Rentals", 7),
      LandlordProfile("Dallas Crash Pads", null),
      LandlordProfile("GN Company", 2),
    ]),
  );
}

class LandlordProfilesView {
  List<LandlordProfile> profiles;

  LandlordProfilesView(this.profiles);
}

class LandlordProfile {
  String name;
  int notificationCount;

  LandlordProfile(
    this.name,
    this.notificationCount,
  );
}
