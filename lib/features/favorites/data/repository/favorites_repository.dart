import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/favorites/data/datasource/base_favorites_remote_data_source.dart';
import 'package:review_shop_app/features/favorites/domain/entities/favorites.dart';
import 'package:review_shop_app/features/favorites/domain/repository/base_favorites_repository.dart';

class FavoritesRepository extends BaseFavoritesRepository
{
  final BaseFavoritesRemoteDataSource baseFavoritesRemoteDataSource;

  FavoritesRepository(this.baseFavoritesRemoteDataSource);
  @override
  Future<Either<Failure, Favorites>> getFavorites() async{
    final result = await baseFavoritesRemoteDataSource.getFavorites();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}