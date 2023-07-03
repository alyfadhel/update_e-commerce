import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/widgets/toast_state.dart';
import 'package:review_shop_app/features/home/presentation/widgets/build_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is ShopChangeFavoritesSuccessState)
        {
          if (!state.changeFavorites.status!) {
            showToast(
              text: state.changeFavorites.message!,
              state: ToastState.error,
            );
          } else {
            showToast(
              text: state.changeFavorites.message!,
              state: ToastState.success,
            );
          }
        }

        if (state is ShopCartSuccessState) {
          if (state.cart.status) {
            showToast(
              text: state.cart.message,
              state: ToastState.success,
            );
          } else {
            showToast(
              text: state.cart.message,
              state: ToastState.error,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.home != null,
          builder: (context) => BuildItem(home: cubit.home!),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
