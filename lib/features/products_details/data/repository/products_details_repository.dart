import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/products_details/data/datasource/base_products_details_remote_data_source.dart';
import 'package:review_shop_app/features/products_details/domain/entities/products_details.dart';
import 'package:review_shop_app/features/products_details/domain/repository/base_products_details_repository.dart';

class ProductsDetailsRepository extends BaseProductsDetailsRepository
{
  final BaseProductsDetailsRemoteDataSource baseProductsDetailsRemoteDataSource;

  ProductsDetailsRepository(this.baseProductsDetailsRemoteDataSource);
  @override
  Future<Either<Failure, ProductsDetails>> getProductsDetails(ProductsParameter parameter)async {
    final result = await baseProductsDetailsRemoteDataSource.getProductsDetails(parameter);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}