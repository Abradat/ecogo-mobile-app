class Place {
  String? streetNumber;
  String? street;
  String? city;
  String? zipCode;
  double? latitude;
  double? longitude;

  Place(
      {this.streetNumber,
      this.street,
      this.city,
      this.zipCode,
      this.latitude,
      this.longitude});

  @override
  String toString() {
    return 'Place{streetNumber: $streetNumber, street: $street, city: $city, zipCode: $zipCode, latitude: $latitude, longitude: $longitude}';
  }
}
