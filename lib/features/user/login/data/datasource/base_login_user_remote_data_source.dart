import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end_points.dart';
import 'package:review_shop_app/features/user/login/data/model/login_model.dart';
import 'package:review_shop_app/features/user/login/domain/repository/base_login_repository.dart';



abstract class BaseLoginUserRemoteDataSource {
  Future<LoginModel> getLoginUser(LoginParameters parameters);
}

class LoginUserRemoteDataSource extends BaseLoginUserRemoteDataSource {
  final DioHelper dioHelper;

  LoginUserRemoteDataSource(this.dioHelper);

  @override
  Future<LoginModel> getLoginUser(LoginParameters parameters) async {
    final response = await dioHelper.post(
      endPoint: loginEndPoint,
      data: {
        'email' : parameters.email,
        'password' : parameters.password,
      },
      Authorization: token,
      lang: language,
    );
    return LoginModel.fromJson(response);
  }
}
