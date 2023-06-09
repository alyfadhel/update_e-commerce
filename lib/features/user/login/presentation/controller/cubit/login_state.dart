

import 'package:review_shop_app/features/user/login/domain/entities/login.dart';

abstract class LoginState{}

class LoginInitialState extends LoginState{}

class ChangeVisibilityLoginState extends LoginState{}

class LoginUserLoadingState extends LoginState{}
class LoginUserSuccessState extends LoginState{
  final Login login;

  LoginUserSuccessState(this.login);
}
class LoginUserErrorState extends LoginState{
  final String error;

  LoginUserErrorState(this.error);
}
