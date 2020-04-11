class Passport {
  final String number;
  final String country;

  Passport({
    this.number,
    this.country,
  });

  Map<String, Object> get asMap => {
    'number': number,
    'country': country
  };
}
