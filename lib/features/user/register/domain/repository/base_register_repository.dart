import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/user/register/domain/entities/register.dart';


abstract class BaseRegisterUserRepository {
  Future<Either<Failure, Register>> getUserRegister(RegisterParameter parameter);
}

class RegisterParameter extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String password;

  const RegisterParameter({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  List<Object?> get props => [
    name,
    phone,
    email,
    password,
  ];
}
