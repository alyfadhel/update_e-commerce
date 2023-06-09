import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/search/data/datasource/base_search_remote_data_source.dart';
import 'package:review_shop_app/features/search/domain/entities/search.dart';
import 'package:review_shop_app/features/search/domain/repository/base_serach_repository.dart';

class SearchRepository extends BaseSearchRepository
{
  final BaseSearchRemoteDataSource baseSearchRemoteDataSource;

  SearchRepository(this.baseSearchRemoteDataSource);
  @override
  Future<Either<Failure, Search>> getSearch(SearchParameter parameter)async {
    final result = await baseSearchRemoteDataSource.getSearch(parameter);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.error));
    }
  }

}