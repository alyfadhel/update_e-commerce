import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:review_shop_app/core/error/failure.dart';
import 'package:review_shop_app/features/user/update_profile/domain/entities/update_profile.dart';


abstract class BaseUpdateProfileRepository {
  Future<Either<Failure, UpdateProfile>> getUpdateProfile(UpdateParameter parameter);
}

class UpdateParameter extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String image;

  const UpdateParameter({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  @override
  List<Object?> get props => [
    name,
    email,
    phone,
    image,
  ];
}
