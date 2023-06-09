import 'package:dartz/dartz.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/user/settings/domain/entities/profile.dart';


abstract class BaseProfileRepository
{
  Future<Either<Failure,Profile>>getProfile();
}
