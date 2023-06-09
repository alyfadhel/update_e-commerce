import 'package:equatable/equatable.dart';

class CategoriesDetails extends Equatable {
  final bool? status;
  final CategoriesDetailsData? data;

  const CategoriesDetails({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class CategoriesDetailsData extends Equatable {
  final int? currentPage;
  final List<CategoriesDataDetailsData>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  const CategoriesDetailsData({
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

class CategoriesDataDetailsData extends Equatable{
  final int? id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String>? images;
  final bool? inFavorites;
  final bool? inCart;

  const CategoriesDataDetailsData({
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
