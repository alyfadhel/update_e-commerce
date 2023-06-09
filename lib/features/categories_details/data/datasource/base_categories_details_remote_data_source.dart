import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end-points.dart';
import 'package:review_shop_app/features/categories_details/data/model/categories_details_model.dart';
import 'package:review_shop_app/features/categories_details/domain/repository/base_categories_details_repository.dart';

abstract class BaseCategoriesDetailsRemoteDataSource {
  Future<CategoriesDetailsModel> getCategoriesDetails(
      CategoriesParameter parameter);
}

class CategoriesDetailsRemoteDataSource
    extends BaseCategoriesDetailsRemoteDataSource {
  final DioHelper dioHelper;

  CategoriesDetailsRemoteDataSource(this.dioHelper);

  @override
  Future<CategoriesDetailsModel> getCategoriesDetails(
      CategoriesParameter parameter) async {
    final response = await dioHelper.get(
      endPoint: categoriesDetailsEndPoint(
        parameter.id,
      ),
      Authorization: token,
      lang: language,
    );
    return CategoriesDetailsModel.fromJson(response);
  }
}
