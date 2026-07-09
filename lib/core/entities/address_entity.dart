class AddressEntity {
  final String name;
  final String phone;
  final String address;
  final String apartment;

  AddressEntity({
    required this.name,
    required this.phone,
    required this.address,
    required this.apartment,
  });

  @override
  String toString() {
    return '''
 AddressEntity(
  name: $name,
  phone: $phone,
  address: $address,
  apartment: $apartment
)
''';
  }
}
