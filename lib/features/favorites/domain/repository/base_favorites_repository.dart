import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/favorites/domain/entities/favorites.dart';

abstract class BaseFavoritesRepository
{
  Future<Either<Failure,List<FavoritesData>>>getFavorites();
}