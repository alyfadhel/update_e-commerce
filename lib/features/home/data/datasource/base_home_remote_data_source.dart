import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end-points.dart';
import 'package:review_shop_app/features/home/data/model/categories_model.dart';
import 'package:review_shop_app/features/home/data/model/home_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHomeData();

  Future<CategoriesModel> getCategoriesData();
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  final DioHelper dioHelper;

  HomeRemoteDataSource(this.dioHelper);

  @override
  Future<HomeModel> getHomeData() async {
    final response = await dioHelper.get(
      endPoint: homeEndPoint,
      Authorization: token,
      lang: language,
    );
    return HomeModel.fromJson(response);
  }

  @override
  Future<CategoriesModel> getCategoriesData() async {
    final response = await dioHelper.get(
      endPoint: categoriesEndPoint,
      Authorization: token,
      lang: language,
    );
    return CategoriesModel.fromJson(response);
  }
}
