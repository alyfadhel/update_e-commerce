import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/favorites/domain/entities/favorites.dart';
import 'package:review_shop_app/features/favorites/domain/repository/base_favorites_repository.dart';

class GetFavoritesUseCase extends BaseUseCase<List<FavoritesData>,NoParameters>
{
  final BaseFavoritesRepository baseFavoritesRepository;

  GetFavoritesUseCase(this.baseFavoritesRepository);
  @override
  Future<Either<Failure, List<FavoritesData>>> call(NoParameters parameter)async {
    return await baseFavoritesRepository.getFavorites();
  }

}