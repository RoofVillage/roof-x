import 'package:key/index.dart' as _key;
import 'package:mappable/index.dart';

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
        postalCode: map[_key.postalCode],
        countryCode: map[_key.countryCode],
        city: map[_key.city],
        state: map[_key.state],
        street: map[_key.street]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.postalCode: postalCode,
      _key.countryCode: countryCode,
      _key.city: city,
      _key.state: state,
      _key.street: street
    };
  }
}
