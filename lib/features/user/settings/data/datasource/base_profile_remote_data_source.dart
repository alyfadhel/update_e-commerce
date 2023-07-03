import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end_points.dart';
import 'package:review_shop_app/features/user/settings/data/model/profile_model.dart';


abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource {
  final DioHelper dioHelper;

  ProfileRemoteDataSource(this.dioHelper);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await dioHelper.get(
      endPoint: profileEndPoint,
      lang: language,
      Authorization: token,
    );
    return ProfileModel.fromJson(response);
  }
}
