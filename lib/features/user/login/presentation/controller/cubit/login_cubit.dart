import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/features/user/login/domain/entities/login.dart';
import 'package:review_shop_app/features/user/login/domain/repository/base_login_repository.dart';
import 'package:review_shop_app/features/user/login/domain/usecase/get_login_user_use_case.dart';
import 'package:review_shop_app/features/user/login/presentation/controller/cubit/login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.getLoginUserUseCase,
  ) : super(LoginInitialState());

  final GetLoginUserUseCase getLoginUserUseCase;
  Login? login;

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void changeVisibilityLogin() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisibilityLoginState());
  }

  void getLoginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginUserLoadingState());

    final result = await getLoginUserUseCase(
      LoginParameters(email: email, password: password),
    );
    result.fold(
      (l) {
        emit(LoginUserErrorState(l.message));
      },
      (r) {
        login = r;
        emit(LoginUserSuccessState(r));
      },
    );
  }
}
