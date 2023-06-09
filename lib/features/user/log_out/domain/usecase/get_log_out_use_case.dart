import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/core/usecase/base_usecase.dart';
import 'package:review_shop_app/features/user/log_out/domain/entities/logout.dart';
import 'package:review_shop_app/features/user/log_out/domain/repository/base_logout_repository.dart';


class GetLogOutUseCase extends BaseUseCase<LogOut,TokenParameter>
{
  final BaseLogOutRepository baseLogOutRepository;

  GetLogOutUseCase(this.baseLogOutRepository);
  @override
  Future<Either<Failure, LogOut>> call(TokenParameter parameters)async {
    return await baseLogOutRepository.getLogOut(parameters);
  }

}