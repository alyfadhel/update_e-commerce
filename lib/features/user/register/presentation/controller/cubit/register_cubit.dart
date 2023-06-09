import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/features/user/register/domain/entities/register.dart';
import 'package:review_shop_app/features/user/register/domain/repository/base_register_repository.dart';
import 'package:review_shop_app/features/user/register/domain/usecase/get_user_register_use_case.dart';
import 'package:review_shop_app/features/user/register/presentation/controller/cubit/register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this.getUserRegisterUseCase,
  ) : super(RegisterInitialState());

  final GetUserRegisterUseCase getUserRegisterUseCase;

  Register? register;

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void changeVisibilityRegister() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisibilityRegisterState());
  }

  void getRegisterUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(RegisterUserLoadingState());

    final result = await getUserRegisterUseCase(
      RegisterParameter(
        name: name,
        email: email,
        phone: phone,
        password: password,
      ),
    );
    result.fold(
      (l) {
        emit(RegisterUserErrorState(l.message));
      },
      (r) {
        register = r;
        emit(RegisterUserSuccessState(r));
      },
    );
  }
}
