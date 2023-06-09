import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/categories_details/domain/entities/categories_details.dart';

abstract class BaseCategoriesDetailsRepository {
  Future<Either<Failure, CategoriesDetails>> getCategoriesDetails(CategoriesParameter parameter);
}

class CategoriesParameter extends Equatable {
  final int id;

  const CategoriesParameter({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}
