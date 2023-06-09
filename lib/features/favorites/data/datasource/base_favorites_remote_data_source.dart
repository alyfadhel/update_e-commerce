import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end-points.dart';
import 'package:review_shop_app/features/favorites/data/model/favorites_model.dart';

abstract class BaseFavoritesRemoteDataSource {
  Future<FavoritesModel> getFavorites();
}

class FavoritesRemoteDataSource extends BaseFavoritesRemoteDataSource {
  final DioHelper dioHelper;

  FavoritesRemoteDataSource(this.dioHelper);

  @override
  Future<FavoritesModel> getFavorites() async {
    final response = await dioHelper.get(
      endPoint: favoritesEndPoint,
      Authorization: token,
      lang: language,
    );
    return FavoritesModel.fromJson(response);
  }
}
