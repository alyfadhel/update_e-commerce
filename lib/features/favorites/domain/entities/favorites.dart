import 'package:equatable/equatable.dart';

class Favorites extends Equatable {
  final bool? status;
  final FavoritesData? data;

  const Favorites({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class FavoritesData extends Equatable {
  final int? currentPage;
  final List<FavoritesDetailsData>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  const FavoritesData({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  @override
  List<Object?> get props => [
        currentPage,
        data,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        path,
        perPage,
        to,
        total,
      ];
}

class FavoritesDetailsData extends Equatable {
  final int? id;
  final Product? product;

  const FavoritesDetailsData({
    required this.id,
    required this.product,
  });

  @override
  List<Object?> get props => [
        id,
        product,
      ];
}

class Product extends Equatable {
  final int? id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String? image;
  final String? name;
  final String? description;

  const Product({
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
