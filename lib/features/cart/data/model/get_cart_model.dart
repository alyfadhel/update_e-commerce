import 'package:review_shop_app/features/cart/domain/entities/get_cart.dart';

class GetCartModel extends GetCart {
  const GetCartModel({
    required super.status,
    required super.data,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
      status: json['status'],
      data: GetCartDataModel.fromJson(json['data']),
    );
  }
}

class GetCartDataModel extends GetCartData {
  const GetCartDataModel({
    required super.cartItems,
    required super.subTotal,
    required super.total,
  });

  factory GetCartDataModel.fromJson(Map<String, dynamic> json) {
    List<CartItemsModel> cart_items = [];
    if (json['cart_items'] != null) {
      json['cart_items'].forEach((element) {
        cart_items.add(CartItemsModel.fromJson(element));
      });
    }
    return GetCartDataModel(
      cartItems: cart_items,
      subTotal: json['sub_total'],
      total: json['total'],
    );
  }
}

class CartItemsModel extends CartItems {
  const CartItemsModel({
    required super.id,
    required super.quantity,
    required super.product,
  });

  factory CartItemsModel.fromJson(Map<String, dynamic> json) {
    return CartItemsModel(
      id: json['id'],
      quantity: json['quantity'],
      product:  CartItemsProductModel.fromJson(json['product']),
    );
  }
}

class CartItemsProductModel extends CartItemsProduct {
  const CartItemsProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.images,
    required super.inFavorites,
    required super.inCart,
  });

  factory CartItemsProductModel.fromJson(Map<String, dynamic> json) {
    return CartItemsProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images'].map((e) => e)),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
