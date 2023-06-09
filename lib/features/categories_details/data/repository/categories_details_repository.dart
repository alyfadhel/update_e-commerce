import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/categories_details/data/datasource/base_categories_details_remote_data_source.dart';
import 'package:review_shop_app/features/categories_details/domain/entities/categories_details.dart';
import 'package:review_shop_app/features/categories_details/domain/repository/base_categories_details_repository.dart';

class CategoriesDetailsRepository extends BaseCategoriesDetailsRepository
{
  final BaseCategoriesDetailsRemoteDataSource baseCategoriesDetailsRemoteDataSource;

  CategoriesDetailsRepository(this.baseCategoriesDetailsRemoteDataSource);
  @override
  Future<Either<Failure, CategoriesDetails>> getCategoriesDetails(CategoriesParameter parameter)async {
    final result = await baseCategoriesDetailsRemoteDataSource.getCategoriesDetails(parameter);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}