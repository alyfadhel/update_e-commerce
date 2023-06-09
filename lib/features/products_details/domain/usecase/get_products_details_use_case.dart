import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/products_details/domain/entities/products_details.dart';
import 'package:review_shop_app/features/products_details/domain/repository/base_products_details_repository.dart';

class GetProductsDetailsUseCase extends BaseUseCase<ProductsDetails,ProductsParameter>
{
  final BaseProductsDetailsRepository baseProductsDetailsRepository;

  GetProductsDetailsUseCase(this.baseProductsDetailsRepository);
  @override
  Future<Either<Failure, ProductsDetails>> call(ProductsParameter parameters)async {
    return await baseProductsDetailsRepository.getProductsDetails(parameters);
  }

}