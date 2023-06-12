import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final bool status;
  final String message;
  final CartData data;

  const Cart({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

class CartData extends Equatable {
  final int id;
  final int quantity;
  final CartProduct product;

  const CartData({
    required this.id,
    required this.quantity,
    required this.product,
  });

  @override
  List<Object?> get props => [
        id,
        quantity,
        product,
      ];
}

class CartProduct extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String? image;
  final String? name;
  final String? description;

  const CartProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [
    id,
    price,
    oldPrice,
    discount,
    image,
    name,
    description,
  ];
}
