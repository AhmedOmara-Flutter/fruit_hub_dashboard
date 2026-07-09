
import 'package:fruit_hub_dashboard/core/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.name,
    required super.phone,
    required super.address,
    required super.apartment,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      apartment: json['apartment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'apartment': apartment,
    };
  }

  // from Entity
  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      apartment: entity.apartment,
    );
  }

  // to Entity
  AddressEntity toEntity() {
    return AddressEntity(
      name: name,
      phone: phone,
      address: address,
      apartment: apartment,
    );
  }

}
