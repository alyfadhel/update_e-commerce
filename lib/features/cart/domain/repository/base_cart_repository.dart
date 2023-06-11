import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/cart/domain/entities/cart.dart';
import 'package:review_shop_app/features/cart/domain/entities/get_cart.dart';

abstract class BaseCartRepository {
  Future<Either<Failure, Cart>> getCart(CartParameter parameter);
  Future<Either<Failure, GetCart>> getICartItems(NoParameters parameters);
}

class CartParameter extends Equatable {
  final int id;

  const CartParameter({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}
