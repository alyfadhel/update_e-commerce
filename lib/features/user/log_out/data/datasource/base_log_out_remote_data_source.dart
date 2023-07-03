import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end_points.dart';
import 'package:review_shop_app/features/user/log_out/data/model/log_out_model.dart';
import 'package:review_shop_app/features/user/log_out/domain/repository/base_logout_repository.dart';


abstract class BaseLogOutRemoteDataSource {
  Future<LogOutModel> getLogOut(TokenParameter parameter);
}

class LogOutRemoteDataSource extends BaseLogOutRemoteDataSource {
  final DioHelper dioHelper;

  LogOutRemoteDataSource(this.dioHelper);

  @override
  Future<LogOutModel> getLogOut(TokenParameter parameter) async {
    final response = await dioHelper.post(
      endPoint: logOutEndPoint,
      data: {
        'fcm_token' : parameter.fcmToken,
      },
      Authorization: token,
      lang: language,
    );
    return LogOutModel.fromJson(response);
  }
}
