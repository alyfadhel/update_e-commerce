import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/widgets/toast_state.dart';
import 'package:review_shop_app/features/cart/presentation/widgets/build_item_cart.dart';
import 'package:review_shop_app/features/favorites/presentation/widgets/build_item_favorites.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is ShopChangeFavoritesSuccessState) {
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
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: cubit.cart != null,
            builder: (context) => BuildItemsCart(
              model: cubit.cart!,
            ),
            fallback: (context) =>
            const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
