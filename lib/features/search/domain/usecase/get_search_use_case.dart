import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/search/domain/entities/search.dart';
import 'package:review_shop_app/features/search/domain/repository/base_serach_repository.dart';

class GetSearchUseCase extends BaseUseCase<Search,SearchParameter>
{
  final BaseSearchRepository baseSearchRepository;

  GetSearchUseCase(this.baseSearchRepository);
  @override
  Future<Either<Failure, Search>> call(SearchParameter parameter)async {
    return await baseSearchRepository.getSearch(parameter);
  }

}