import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/change_favorites/domain/entities/change_favorites.dart';

abstract class BaseChangeFavoritesRepository {
  Future<Either<Failure, ChangeFavorites>> getChangeFavorites(ChangeFavoriteParameter parameter);
}

class ChangeFavoriteParameter extends Equatable {
  final int id;

  const ChangeFavoriteParameter({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}
