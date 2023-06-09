import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/user/login/domain/entities/login.dart';


abstract class BaseLoginUserRepository {
  Future<Either<Failure, Login>> getUserLogin(LoginParameters parameters);
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
    email,
    password,
  ];
}
