import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end_points.dart';
import 'package:review_shop_app/features/products_details/data/model/products_details_model.dart';
import 'package:review_shop_app/features/products_details/domain/repository/base_products_details_repository.dart';

abstract class BaseProductsDetailsRemoteDataSource {
  Future<ProductsDetailsModel> getProductsDetails(ProductsParameter parameter);
}

class ProductsDetailsRemoteDataSource
    extends BaseProductsDetailsRemoteDataSource {
  final DioHelper dioHelper;

  ProductsDetailsRemoteDataSource(this.dioHelper);

  @override
  Future<ProductsDetailsModel> getProductsDetails(
      ProductsParameter parameter) async {
    final response = await dioHelper.get(
      endPoint: productsDetailsEndPoint(
        parameter.id,
      ),
      Authorization: token,
      lang: language,
    );
    return ProductsDetailsModel.fromJson(response);
  }
}
