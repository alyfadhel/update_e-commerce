import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/search/domain/entities/search.dart';

abstract class BaseSearchRepository {
  Future<Either<Failure, Search>> getSearch(SearchParameter parameter);
}

class SearchParameter extends Equatable {
  final String text;

  const SearchParameter({
    required this.text,
  });

  @override
  List<Object?> get props => [
    text,
  ];
}
