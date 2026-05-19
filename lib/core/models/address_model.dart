
import 'package:fruit_hub_dashboard/core/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.name,
    required super.email,
    required super.address,
    required super.country,
    required super.apartment,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      country: json['country'],
      apartment: json['apartment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'country': country,
      'apartment': apartment,
    };
  }

  // from Entity
  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      name: entity.name,
      email: entity.email,
      address: entity.address,
      country: entity.country,
      apartment: entity.apartment,
    );
  }

  // to Entity
  AddressEntity toEntity() {
    return AddressEntity(
      name: name,
      email: email,
      address: address,
      country: country,
      apartment: apartment,
    );
  }

}
