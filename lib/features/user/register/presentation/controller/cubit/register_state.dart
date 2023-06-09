

import 'package:review_shop_app/features/user/register/domain/entities/register.dart';

abstract class RegisterState{}

class RegisterInitialState extends RegisterState{}

class ChangeVisibilityRegisterState extends RegisterState{}


class RegisterUserLoadingState extends RegisterState{}
class RegisterUserSuccessState extends RegisterState{
  final Register register;

  RegisterUserSuccessState(this.register);
}
class RegisterUserErrorState extends RegisterState{
  final String error;

  RegisterUserErrorState(this.error);
}