import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/exception.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/user/settings/data/datasource/base_profile_remote_data_source.dart';
import 'package:review_shop_app/features/user/settings/domain/entities/profile.dart';
import 'package:review_shop_app/features/user/settings/domain/repository/base_profile_repository.dart';


class ProfileRepository extends BaseProfileRepository
{
  final BaseProfileRemoteDataSource baseProfileRemoteDataSource;

  ProfileRepository(this.baseProfileRemoteDataSource);
  @override
  Future<Either<Failure, Profile>> getProfile() async{
    final result = await baseProfileRemoteDataSource.getProfile();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.error));
    }
  }

}