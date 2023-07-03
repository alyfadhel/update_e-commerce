import 'package:review_shop_app/core/network/dio_helper.dart';
import 'package:review_shop_app/core/network/end_points.dart';
import 'package:review_shop_app/features/user/register/data/model/register_model.dart';
import 'package:review_shop_app/features/user/register/domain/repository/base_register_repository.dart';


abstract class BaseRegisterUserRemoteDataSource {
  Future<RegisterModel> getUserRegister(RegisterParameter parameter);
}

class RegisterUserRemoteDataSource extends BaseRegisterUserRemoteDataSource {
  final DioHelper dioHelper;

  RegisterUserRemoteDataSource(this.dioHelper);

  @override
  Future<RegisterModel> getUserRegister(RegisterParameter parameter) async {
    final response = await dioHelper.post(
      endPoint: registerEndPoint,
      data: {
        'name' : parameter.name,
        'phone' : parameter.phone,
        'email' : parameter.email,
        'password' : parameter.password,
      },
      Authorization: token,
    );
    return RegisterModel.fromJson(response);
  }
}
