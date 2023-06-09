import 'package:review_shop_app/features/change_favorites/domain/entities/change_favorites.dart';

class ChangeFavoritesModel extends ChangeFavorites {
  const ChangeFavoritesModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory ChangeFavoritesModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoritesModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? ChangeFavoritesDataModel.fromJson(json['data']) : null,
    );
  }
}

class ChangeFavoritesDataModel extends ChangeFavoritesData {
  const ChangeFavoritesDataModel({
    required super.id,
    required super.product,
  });

  factory ChangeFavoritesDataModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoritesDataModel(
      id: json['id'],
      product: json['product'] != null
          ? ChangeFavoritesProductModel.fromJson(json['product'])
          : null,
    );
  }
}

class ChangeFavoritesProductModel extends ChangeFavoritesProduct {
  const ChangeFavoritesProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
  });

  factory ChangeFavoritesProductModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoritesProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
    );
  }
}
