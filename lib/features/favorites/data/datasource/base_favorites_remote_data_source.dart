import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end_points.dart';
import 'package:review_shop_app/features/favorites/data/model/favorites_model.dart';

abstract class BaseFavoritesRemoteDataSource {
  Future<List<FavoritesDataModel>> getFavorites();
}

class FavoritesRemoteDataSource extends BaseFavoritesRemoteDataSource {
  final DioHelper dioHelper;

  FavoritesRemoteDataSource(this.dioHelper);

  @override
  Future<List<FavoritesDataModel>> getFavorites() async {
    final response = await dioHelper.get(
      endPoint: favoritesEndPoint,
      Authorization: token,
      lang: language,
    );
    return List<FavoritesDataModel>.from(
      ((response['data']['data'] as List)).map((e) => FavoritesDataModel.fromJson(e)),
    );
  }
}
