class AddressEntity {
  final String name;
  final String email;
  final String address;
  final String country;
  final String apartment;

  AddressEntity({
    required this.name,
    required this.email,
    required this.address,
    required this.country,
    required this.apartment,
  });

  @override
  String toString() {
    return '''
 AddressEntity(
  name: $name,
  email: $email,
  address: $address,
  country: $country,
  apartment: $apartment
)
''';
  }
}
