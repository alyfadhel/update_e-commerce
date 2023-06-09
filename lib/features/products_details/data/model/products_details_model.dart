import 'package:review_shop_app/features/products_details/domain/entities/products_details.dart';

class ProductsDetailsModel extends ProductsDetails {
  const ProductsDetailsModel({
    required super.status,
    required super.data,
  });

  factory ProductsDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductsDetailsModel(
      status: json['status'],
      data: json['data'] != null ? ProductsDetailsDataModel.fromJson(json['data']) : null,
    );
  }
}

class ProductsDetailsDataModel extends ProductsDetailsData {
  const ProductsDetailsDataModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.inFavorites,
    required super.inCart,
    required super.images,
  });

  factory ProductsDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return ProductsDetailsDataModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
      images: List<String>.from(json['images'].map((e) => e)),
    );
  }
}
