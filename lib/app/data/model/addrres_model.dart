class Address {
  Address(
    this.number, {
    required this.lat,
    required this.lon,
    required this.displayName,
  });

  double lat;
  double lon;
  String displayName;
  int number;
}
