import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/shop_layout.dart';
import 'package:review_shop_app/core/network/end-points.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/strings_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:review_shop_app/core/widgets/my_button.dart';
import 'package:review_shop_app/core/widgets/my_form_field.dart';
import 'package:review_shop_app/core/widgets/text_btn.dart';
import 'package:review_shop_app/core/widgets/toast_state.dart';
import 'package:review_shop_app/features/user/login/presentation/controller/cubit/login_cubit.dart';
import 'package:review_shop_app/features/user/login/presentation/controller/cubit/login_state.dart';
import 'package:review_shop_app/features/user/register/presentation/pages/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginUserSuccessState) {
            if (state.login.status!) {
              showToast(
                text: state.login.message!,
                state: ToastState.success,
              );
              token = state.login.data!.token!;
              sl<SharedPreferences>()
                  .setString(
                'token',
                state.login.data!.token!,
              )
                  .then((value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopLayout(),
                  ),
                );
              });
            } else {
              showToast(
                text: state.login.message!,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(
                AppPadding.p20,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.login,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: ColorManager.sBlack,
                              ),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Text(
                          AppStrings.loginTitle,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: ColorManager.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: AppSize.s30,
                        ),
                        MyFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          label: 'email',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.enterUREmail;
                            }
                            return null;
                          },
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.enterURPassword;
                            }
                            return null;
                          },
                          prefix: Icons.lock_outline,
                          isPassword: cubit.isPassword,
                          suffix: cubit.suffix,
                          onPressed: () {
                            cubit.changeVisibilityLogin();
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginUserLoadingState,
                          builder: (context) => MyButton(
                            onPressedTextButton: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.getLoginUser(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: AppStrings.login,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: ColorManager.sWhite,
                                ),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.haveNoAccount,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              width: AppSize.s10,
                            ),
                            MyTextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              },
                              text: AppStrings.register,
                              colors: ColorManager.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
