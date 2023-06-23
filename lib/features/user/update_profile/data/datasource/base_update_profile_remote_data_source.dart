import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end-points.dart';
import 'package:review_shop_app/features/user/update_profile/data/model/update_profile_model.dart';
import 'package:review_shop_app/features/user/update_profile/domain/repository/base_update_profile_use_case.dart';




abstract class BaseUpdateProfileRemoteDataSource {
  Future<UpdateProfileModel> getUpdateProfile(UpdateParameter parameter);
}

class UpdateProfileRemoteDataSource extends BaseUpdateProfileRemoteDataSource {
  final DioHelper dioHelper;

  UpdateProfileRemoteDataSource(this.dioHelper);

  @override
  Future<UpdateProfileModel> getUpdateProfile(UpdateParameter parameter) async {
    final response = await dioHelper.put(
      endPoint: updateProfileEndPoint,
      lang: language,
      Authorization: token,
      data: {
        'name' : parameter.name,
        'email' : parameter.email,
        'phone' : parameter.phone,
      },

    );

    return UpdateProfileModel.fromJson(response);
  }
}
