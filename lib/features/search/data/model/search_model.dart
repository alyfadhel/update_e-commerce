import 'package:review_shop_app/features/search/domain/entities/search.dart';

class SearchModel extends Search {
  const SearchModel({
    required super.status,
    required super.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      status: json['status'],
      data: json['data'] != null ? SearchDataModel.fromJson(json['data']) : null,
    );
  }
}

class SearchDataModel extends SearchData {
  const SearchDataModel({
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

  factory SearchDataModel.fromJson(Map<String, dynamic> json) {
    List<SearchDetailsDataModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(SearchDetailsDataModel.fromJson(element));
      });
    }
    return SearchDataModel(
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

class SearchDetailsDataModel extends SearchDetailsData {
  const SearchDetailsDataModel({
    required super.id,
    required super.price,
    required super.image,
    required super.name,
    required super.description,
    required super.images,
    required super.inFavorites,
    required super.inCart,
  });

  factory SearchDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return SearchDetailsDataModel(
      id: json['id'],
      price: json['price'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images'].map((e) => e)),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
