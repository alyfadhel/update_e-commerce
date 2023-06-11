import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/strings_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/core/widgets/toast_state.dart';
import 'package:review_shop_app/features/favorites/presentation/widgets/build_item_favorites.dart';



class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

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
        return ConditionalBuilder(
          condition: cubit.favorites != null,
          builder: (context){
            if(cubit.favorites!.data!.data!.isNotEmpty) {
              return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => BuildItemsFavorites(
                model: cubit.favorites!.data!.data![index],
              ),
              itemCount: cubit.favorites!.data!.data!.length,
            );
            }else{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.favorites,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: ColorManager.grey,
                          fontSize: AppSize.s40,
                      ),
                    ),
                    const Icon(
                      Icons.menu,
                      size: AppSize.s100,
                      color: ColorManager.grey,
                    )
                  ],
                ),
              );
            }
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
