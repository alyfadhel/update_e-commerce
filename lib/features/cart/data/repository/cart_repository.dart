import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/cart/data/datasource/base_cart_remote_data_source.dart';
import 'package:review_shop_app/features/cart/domain/entities/cart.dart';
import 'package:review_shop_app/features/cart/domain/entities/get_cart.dart';
import 'package:review_shop_app/features/cart/domain/repository/base_cart_repository.dart';

class CartRepository extends BaseCartRepository
{
  final BaseCartRemoteDataSource baseCartRemoteDataSource;

  CartRepository(this.baseCartRemoteDataSource);
  @override
  Future<Either<Failure, Cart>> getCart(CartParameter parameter)async {
    final result = await baseCartRemoteDataSource.getCart(parameter);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetCart>> getICartItems(NoParameters parameters)async {
    final result = await baseCartRemoteDataSource.getCartItems();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.error));
    }
  }

}