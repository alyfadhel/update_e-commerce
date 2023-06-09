import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/user/log_out/domain/entities/logout.dart';

abstract class BaseLogOutRepository {
  Future<Either<Failure, LogOut>> getLogOut(TokenParameter parameter);
}

class TokenParameter extends Equatable {
  final String fcmToken;

  const TokenParameter({
    required this.fcmToken,
  });

  @override
  List<Object?> get props => [
    fcmToken,
  ];
}
