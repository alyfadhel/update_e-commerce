import 'package:equatable/equatable.dart';

class GetCart extends Equatable {
  final bool status;
  final GetCartData data;

  const GetCart({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class GetCartData extends Equatable {
  final List<CartItems> cartItems;
  final dynamic subTotal;
  final dynamic total;

  const GetCartData({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  @override
  List<Object?> get props => [
        cartItems,
        subTotal,
        total,
      ];
}

class CartItems extends Equatable {
  final int id;
  final int quantity;
  final CartItemsProduct product;

  const CartItems({
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

class CartItemsProduct extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  const CartItemsProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
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
    images,
    inFavorites,
    inCart,
  ];
}
