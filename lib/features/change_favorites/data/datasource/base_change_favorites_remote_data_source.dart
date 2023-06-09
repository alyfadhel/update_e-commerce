import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end-points.dart';
import 'package:review_shop_app/features/change_favorites/data/model/change_favorites_model.dart';
import 'package:review_shop_app/features/change_favorites/domain/repository/base_change_favorites_repository.dart';

abstract class BaseChangeFavoritesRemoteDataSource {
  Future<ChangeFavoritesModel> getChangeFavorites(
      ChangeFavoriteParameter parameter);
}

class ChangeFavoritesRemoteDataSource
    extends BaseChangeFavoritesRemoteDataSource {
  final DioHelper dioHelper;

  ChangeFavoritesRemoteDataSource(this.dioHelper);

  @override
  Future<ChangeFavoritesModel> getChangeFavorites(
      ChangeFavoriteParameter parameter) async {
    final response = await dioHelper.post(
      endPoint: changeFavoritesEndPoint,
      Authorization: token,
      lang: language,
      data: {
        'product_id': parameter.id,
      },
    );

    return ChangeFavoritesModel.fromJson(response);
  }
}
