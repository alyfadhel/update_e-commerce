import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/change_favorites/data/datasource/base_change_favorites_remote_data_source.dart';
import 'package:review_shop_app/features/change_favorites/domain/entities/change_favorites.dart';
import 'package:review_shop_app/features/change_favorites/domain/repository/base_change_favorites_repository.dart';

class ChangeFavoritesRepository extends BaseChangeFavoritesRepository
{
  final BaseChangeFavoritesRemoteDataSource baseChangeFavoritesRemoteDataSource;

  ChangeFavoritesRepository(this.baseChangeFavoritesRemoteDataSource);
  @override
  Future<Either<Failure, ChangeFavorites>> getChangeFavorites(ChangeFavoriteParameter parameter)async {
    final result = await baseChangeFavoritesRemoteDataSource.getChangeFavorites(parameter);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}