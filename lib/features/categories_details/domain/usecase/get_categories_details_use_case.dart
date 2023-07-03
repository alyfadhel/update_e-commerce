import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/categories_details/domain/entities/categories_details.dart';
import 'package:review_shop_app/features/categories_details/domain/repository/base_categories_details_repository.dart';

class GetCategoriesDetailsUseCase extends BaseUseCase<CategoriesDetails,CategoriesParameter>
{
  final BaseCategoriesDetailsRepository baseCategoriesDetailsRepository;

  GetCategoriesDetailsUseCase(this.baseCategoriesDetailsRepository);
  @override
  Future<Either<Failure, CategoriesDetails>> call(CategoriesParameter parameter)async {
    return await baseCategoriesDetailsRepository.getCategoriesDetails(parameter);
  }

}