import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/change_favorites/domain/entities/change_favorites.dart';
import 'package:review_shop_app/features/change_favorites/domain/repository/base_change_favorites_repository.dart';

class GetChangeFavoritesUseCase extends BaseUseCase<ChangeFavorites,ChangeFavoriteParameter>
{
  final BaseChangeFavoritesRepository baseChangeFavoritesRepository;

  GetChangeFavoritesUseCase(this.baseChangeFavoritesRepository);
  @override
  Future<Either<Failure, ChangeFavorites>> call(ChangeFavoriteParameter parameter)async {
    return await baseChangeFavoritesRepository.getChangeFavorites(parameter);
  }

}