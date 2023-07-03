import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end_points.dart';
import 'package:review_shop_app/features/search/data/model/search_model.dart';
import 'package:review_shop_app/features/search/domain/repository/base_serach_repository.dart';

abstract class BaseSearchRemoteDataSource {
  Future<SearchModel> getSearch(SearchParameter parameter);
}

class SearchRemoteDataSource extends BaseSearchRemoteDataSource {
  final DioHelper dioHelper;

  SearchRemoteDataSource(this.dioHelper);

  @override
  Future<SearchModel> getSearch(SearchParameter parameter) async {
    final response = await dioHelper.post(
      endPoint: searchEndPoint,
      Authorization: token,
      lang: language,
      data: {
        'text' : parameter.text,
      },
    );
    return SearchModel.fromJson(response);
  }
}
