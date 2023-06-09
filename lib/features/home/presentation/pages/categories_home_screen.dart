import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/features/home/presentation/widgets/categories_item.dart';



class CategoriesHomeScreen extends StatelessWidget {
  const CategoriesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return SizedBox(
          height: AppSize.s150,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                BuildHomeCategories(categories: cubit.categories!.data!.data![index]),
            separatorBuilder: (context, index) => const SizedBox(
              width: AppSize.s15,
            ),
            itemCount: cubit.categories!.data!.data!.length,
          ),
        );
      },
    );
  }
}
