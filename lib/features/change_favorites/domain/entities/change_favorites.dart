import 'package:equatable/equatable.dart';

class ChangeFavorites extends Equatable {
  final bool? status;
  final String? message;
  final ChangeFavoritesData? data;

  const ChangeFavorites({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

class ChangeFavoritesData extends Equatable {
  final int? id;
  final ChangeFavoritesProduct? product;

  const ChangeFavoritesData({
    required this.id,
    required this.product,
  });

  @override
  List<Object?> get props => [
        id,
        product,
      ];
}

class ChangeFavoritesProduct extends Equatable {
  final int? id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String? image;

  const ChangeFavoritesProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  @override
  List<Object?> get props => [
    id,
    price,
    oldPrice,
    discount,
    image,
  ];
}
