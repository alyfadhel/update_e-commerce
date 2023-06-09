import 'package:review_shop_app/features/home/domain/entities/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({
    required super.status,
    required super.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'],
      data: json['data'] != null ? CategoriesDataModel.fromJson(json['data']) : null,
    );
  }
}

class CategoriesDataModel extends CategoriesData {
  const CategoriesDataModel({
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

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    List<CategoriesDataDetailsModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(CategoriesDataDetailsModel.fromJson(element));
      });
    }
    return CategoriesDataModel(
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

class CategoriesDataDetailsModel extends CategoriesDataDetails {
  const CategoriesDataDetailsModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CategoriesDataDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDataDetailsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
