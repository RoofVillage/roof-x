class Address {
  final String address1;
  final String address2;
  final String address3;
  final String city;
  final String stateProvinceRegion;
  final String postalCode;
  final String country;

  Address({
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.stateProvinceRegion,
    this.postalCode,
    this.country,
  });

  Map<String, Object> get asMap => {
        'address1': address1,
        'address2': address2,
        'address3': address3,
        'city': city,
        'stateProvinceRegion': stateProvinceRegion,
        'postalCode': postalCode,
        'country': country,
      };
}
