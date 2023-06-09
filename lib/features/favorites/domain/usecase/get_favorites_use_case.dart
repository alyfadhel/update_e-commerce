import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/favorites/domain/entities/favorites.dart';
import 'package:review_shop_app/features/favorites/domain/repository/base_favorites_repository.dart';

class GetFavoritesUseCase extends BaseUseCase<Favorites,NoParameters>
{
  final BaseFavoritesRepository baseFavoritesRepository;

  GetFavoritesUseCase(this.baseFavoritesRepository);
  @override
  Future<Either<Failure, Favorites>> call(NoParameters parameters)async {
    return await baseFavoritesRepository.getFavorites();
  }

}