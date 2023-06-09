import 'package:review_shop_app/features/favorites/domain/entities/favorites.dart';

class FavoritesModel extends Favorites {
  const FavoritesModel({
    required super.status,
    required super.data,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      status: json['status'],
      data: json['data'] != null ? FavoritesDataModel.fromJson(json['data']) : null,
    );
  }
}

class FavoritesDataModel extends FavoritesData {
  const FavoritesDataModel({
    required super.currentPage,
    required super.data,
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    required super.path,
    required super.perPage,
    required super.to,
    required super.total,
  });

  factory FavoritesDataModel.fromJson(Map<String, dynamic> json) {
    List<FavoritesDetailsDataModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(FavoritesDetailsDataModel.fromJson(element));
      });
    }
    return FavoritesDataModel(
      currentPage: json['current_page'],
      data: data,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class FavoritesDetailsDataModel extends FavoritesDetailsData {
  const FavoritesDetailsDataModel({
    required super.id,
    required super.product,
  });

  factory FavoritesDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return FavoritesDetailsDataModel(
      id: json['id'],
      product: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : null,
    );
  }
}

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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
