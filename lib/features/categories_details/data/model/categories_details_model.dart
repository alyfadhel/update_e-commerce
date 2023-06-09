import 'package:review_shop_app/features/categories_details/domain/entities/categories_details.dart';

class CategoriesDetailsModel extends CategoriesDetails {
  const CategoriesDetailsModel({
    required super.status,
    required super.data,
  });

  factory CategoriesDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDetailsModel(
      status: json['status'],
      data: json['data'] != null ? CategoriesDetailsDataModel.fromJson(json['data']) : null,
    );
  }
}

class CategoriesDetailsDataModel extends CategoriesDetailsData {
  const CategoriesDetailsDataModel({
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

  factory CategoriesDetailsDataModel.fromJson(Map<String, dynamic> json) {
    List<CategoriesDataDetailsDataModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(CategoriesDataDetailsDataModel.fromJson(element));
      });
    }
    return CategoriesDetailsDataModel(
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

class CategoriesDataDetailsDataModel extends CategoriesDataDetailsData {
  const CategoriesDataDetailsDataModel({
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

  factory CategoriesDataDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDataDetailsDataModel(
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
