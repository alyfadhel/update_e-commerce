import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/user/register/domain/entities/register.dart';
import 'package:review_shop_app/features/user/register/domain/repository/base_register_repository.dart';


class GetUserRegisterUseCase extends BaseUseCase<Register,RegisterParameter>
{
  final BaseRegisterUserRepository baseRegisterRepository;

  GetUserRegisterUseCase(this.baseRegisterRepository);
  @override
  Future<Either<Failure, Register>> call(RegisterParameter parameter)async {
    return await baseRegisterRepository.getUserRegister(parameter);
  }

}