import 'package:views/src/types/lease_preview.dart';

class Property {
  final String address;
  final String unit;
  final List<LeasePreview> activeLeases;
  final List<LeasePreview> upcomingLeases;
  final List<String> tags;

  Property({
    this.address,
    this.unit,
    List<String> tags,
    List<LeasePreview> activeLeases,
    List<LeasePreview> upcomingLeases,
  })  : this.activeLeases = activeLeases ?? [],
        this.upcomingLeases = upcomingLeases ?? [],
        this.tags = tags ?? [];
}
