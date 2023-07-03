import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/user/settings/domain/entities/profile.dart';
import 'package:review_shop_app/features/user/settings/domain/repository/base_profile_repository.dart';


class GetProfileUseCase extends BaseUseCase<Profile,NoParameters>
{
  final BaseProfileRepository baseProfileRepository;

  GetProfileUseCase(this.baseProfileRepository);
  @override
  Future<Either<Failure, Profile>> call(NoParameters parameter)async {
    return await baseProfileRepository.getProfile();
  }

}