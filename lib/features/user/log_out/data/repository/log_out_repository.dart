import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/user/log_out/data/datasource/base_log_out_remote_data_source.dart';
import 'package:review_shop_app/features/user/log_out/domain/entities/logout.dart';
import 'package:review_shop_app/features/user/log_out/domain/repository/base_logout_repository.dart';


class LogOutRepository extends BaseLogOutRepository
{
  final BaseLogOutRemoteDataSource baseLogOutRemoteDataSource;

  LogOutRepository(this.baseLogOutRemoteDataSource);
  @override
  Future<Either<Failure, LogOut>> getLogOut(TokenParameter parameter)async {
    final result = await baseLogOutRemoteDataSource.getLogOut(parameter);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.error));
    }
  }

}