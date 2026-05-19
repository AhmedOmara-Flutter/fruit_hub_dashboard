import 'package:fruit_hub_dashboard/core/entities/address_entity.dart';
import 'package:fruit_hub_dashboard/core/entities/cart_entity.dart';
import 'package:fruit_hub_dashboard/core/utils/app_constants.dart';

class OrderEntity {
  final String uId;
  final DateTime? createdAt;
  final CartEntity cartEntity;
  bool? isCashOnDelivery;
  AddressEntity? addressEntity;

  OrderEntity({
    required this.cartEntity,
    this.isCashOnDelivery,
    this.addressEntity,
    required this.uId,
    this.createdAt,
  });

  @override
  String toString() {
    return '''
OrderEntity(
  uId: $uId,
  isCashOnDelivery: $isCashOnDelivery,

  address:
  $addressEntity,

  cart:
  $cartEntity
)
''';
  }

  double allOrdersPrice() {
    double totalPrice = 0;
    for (var item in cartEntity.cartItems) {
      totalPrice += item.totalPrice+AppConstants.delivery;
    }
    return totalPrice;
  }

  String getFullAddress() {
    return '${addressEntity!.address}, ${addressEntity!.country}, ${addressEntity!.apartment}';
  }
}
