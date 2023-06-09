import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:review_shop_app/core/widgets/toast_state.dart';
import 'package:review_shop_app/features/user/login/presentation/pages/login_screen.dart';
import 'package:review_shop_app/features/user/settings/presentation/widgets/build_proile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<ShopCubit>()..getProfile(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {
          if (state is ShopUpdateProfileSuccessState) {
            if (state.updateProfile.status!) {
              showToast(
                text: state.updateProfile.message!,
                state: ToastState.success,
              );
            } else {
              showToast(
                text: state.updateProfile.message!,
                state: ToastState.error,
              );
            }
          }
          if (state is ShopLogOutSuccessState) {
            if (state.logOut.status!) {
              showToast(
                text: state.logOut.message!,
                state: ToastState.success,
              );
              sl<SharedPreferences>().remove('token').then((value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              });
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.profile != null,
            builder: (context) => BuildProfile(
              profile: cubit.profile!,
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
