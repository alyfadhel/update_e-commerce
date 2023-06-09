import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/user/register/data/datasource/base_user_register_remote_data_source.dart';
import 'package:review_shop_app/features/user/register/domain/entities/register.dart';
import 'package:review_shop_app/features/user/register/domain/repository/base_register_repository.dart';


class RegisterUserRepository extends BaseRegisterUserRepository
{
  final BaseRegisterUserRemoteDataSource baseRegisterUserRemoteDataSource;

  RegisterUserRepository(this.baseRegisterUserRemoteDataSource);
  @override
  Future<Either<Failure, Register>> getUserRegister(RegisterParameter parameter)async {
    final result = await baseRegisterUserRemoteDataSource.getUserRegister(parameter);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}