import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/user/login/data/datasource/base_login_user_remote_data_source.dart';
import 'package:review_shop_app/features/user/login/domain/entities/login.dart';
import 'package:review_shop_app/features/user/login/domain/repository/base_login_repository.dart';


class LoginUserRepository extends BaseLoginUserRepository
{
  final BaseLoginUserRemoteDataSource baseLoginUserRemoteDataSource;

  LoginUserRepository(this.baseLoginUserRemoteDataSource);
  @override
  Future<Either<Failure, Login>> getUserLogin(LoginParameters parameters)async {
   final result = await baseLoginUserRemoteDataSource.getLoginUser(parameters);

   try{
     return Right(result);
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.statusErrorMessageModel.message));
   }
  }

}