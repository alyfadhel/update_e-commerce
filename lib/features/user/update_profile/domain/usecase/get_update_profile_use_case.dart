import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/user/update_profile/domain/entities/update_profile.dart';
import 'package:review_shop_app/features/user/update_profile/domain/repository/base_update_profile_use_case.dart';


class GetUpdateProfileUseCase extends BaseUseCase<UpdateProfile,UpdateParameter>
{
  final BaseUpdateProfileRepository baseUpdateProfileRepository;

  GetUpdateProfileUseCase(this.baseUpdateProfileRepository);
  @override
  Future<Either<Failure, UpdateProfile>> call(UpdateParameter parameter)async {
    return await baseUpdateProfileRepository.getUpdateProfile(parameter);
  }

}