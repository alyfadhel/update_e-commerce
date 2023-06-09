import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/user/update_profile/data/datasource/base_update_profile_remote_data_source.dart';
import 'package:review_shop_app/features/user/update_profile/domain/entities/update_profile.dart';
import 'package:review_shop_app/features/user/update_profile/domain/repository/base_update_profile_use_case.dart';


class UpdateProfileRepository extends BaseUpdateProfileRepository
{
  final BaseUpdateProfileRemoteDataSource baseUpdateProfileRemoteDataSource;

  UpdateProfileRepository(this.baseUpdateProfileRemoteDataSource);
  @override
  Future<Either<Failure, UpdateProfile>> getUpdateProfile(UpdateParameter parameter) async{
    final result = await baseUpdateProfileRemoteDataSource.getUpdateProfile(parameter);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}