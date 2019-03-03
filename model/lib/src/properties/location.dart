import '../utils/index.dart';

class Location with Mappable {
  final String postalCode;
  final String countryCode;
  final String city;
  final String state;
  final String street;

  Location(
      {this.postalCode, this.countryCode, this.city, this.state, this.street});

  factory Location.fromMap(Map<String, Object> map) {
    if (map == null) return null;

    return Location(
        postalCode: map[Key.postalCode],
        countryCode: map[Key.countryCode],
        city: map[Key.city],
        state: map[Key.state],
        street: map[Key.street]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.postalCode: postalCode,
      Key.countryCode: countryCode,
      Key.city: city,
      Key.state: state,
      Key.street: street
    };
  }
}
