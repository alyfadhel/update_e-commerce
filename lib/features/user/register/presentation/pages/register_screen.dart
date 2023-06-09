import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/strings_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:review_shop_app/core/widgets/my_button.dart';
import 'package:review_shop_app/core/widgets/my_form_field.dart';
import 'package:review_shop_app/core/widgets/toast_state.dart';
import 'package:review_shop_app/features/user/login/presentation/pages/login_screen.dart';
import 'package:review_shop_app/features/user/register/presentation/controller/cubit/register_cubit.dart';
import 'package:review_shop_app/features/user/register/presentation/controller/cubit/register_state.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterUserSuccessState) {
            if (state.register.status!) {
              showToast(
                text: state.register.message!,
                state: ToastState.success,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            } else {
              showToast(
                text: state.register.message!,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
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
                          AppStrings.register,
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
                          AppStrings.registerTitle,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: ColorManager.grey,
                              ),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: cubit.nameController,
                          type: TextInputType.text,
                          label: 'name',
                          prefix: Icons.person,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.enterURName;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          label: 'email',
                          prefix: Icons.email_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.enterUREmail;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: cubit.phoneController,
                          type: TextInputType.phone,
                          label: 'phone',
                          prefix: Icons.phone_android,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.enterURPhone;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'password',
                          prefix: Icons.lock_outline,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.enterURPassword;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterUserLoadingState,
                          builder: (context) => MyButton(
                            onPressedTextButton: () {
                              if(cubit.formKey.currentState!.validate()) {
                                cubit.getRegisterUser(
                                name: cubit.nameController.text,
                                email: cubit.emailController.text,
                                phone: cubit.phoneController.text,
                                password: cubit.passwordController.text,
                              );
                              }
                            },
                            text: AppStrings.register,
                            style:
                                Theme.of(context).textTheme.titleLarge!.copyWith(
                                      color: ColorManager.sWhite,
                                    ),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
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
