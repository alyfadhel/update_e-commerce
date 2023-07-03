import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/home/domain/entities/categories.dart';
import 'package:review_shop_app/features/home/domain/repository/base_home_repository.dart';

class GetCategoriesUseCase extends BaseUseCase<Categories,NoParameters>
{
  final BaseHomeRepository baseHomeRepository;

  GetCategoriesUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, Categories>> call(NoParameters parameter)async {
    return await baseHomeRepository.getCategoriesData();
  }

}