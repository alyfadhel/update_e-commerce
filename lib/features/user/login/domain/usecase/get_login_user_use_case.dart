import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/user/login/domain/entities/login.dart';
import 'package:review_shop_app/features/user/login/domain/repository/base_login_repository.dart';


class GetLoginUserUseCase extends BaseUseCase<Login,LoginParameters>
{
  final BaseLoginUserRepository baseLoginUserRepository;

  GetLoginUserUseCase(this.baseLoginUserRepository);
  @override
  Future<Either<Failure, Login>> call(LoginParameters parameter)async {
    return await baseLoginUserRepository.getUserLogin(parameter);
  }

}