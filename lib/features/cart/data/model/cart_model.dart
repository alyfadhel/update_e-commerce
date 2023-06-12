import 'package:review_shop_app/features/cart/domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      status: json['status'],
      message: json['message'],
      data: CartDataModel.fromJson(json['data']) ,
    );
  }
}

class CartDataModel extends CartData {
  const CartDataModel({
    required super.id,
    required super.quantity,
    required super.product,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    return CartDataModel(
      id: json['id'],
      quantity: json['quantity'],
      product: CartProductModel.fromJson(json['product'])
          ,
    );
  }
}

class CartProductModel extends CartProduct {
  const CartProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
