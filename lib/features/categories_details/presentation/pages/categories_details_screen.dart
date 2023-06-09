import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:review_shop_app/features/categories_details/presentation/widgets/build_categories_details.dart';


class CategoriesDetailsScreen extends StatelessWidget {
  final int id;

  const CategoriesDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<ShopCubit>()
        ..getCategoriesDetails(
          id: id,
        ),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: cubit.categoriesDetails != null,
              builder: (context) => ListView.builder(
                itemBuilder: (context, index) => BuildCategoriesDetailsScreen(
                  model: cubit.categoriesDetails!.data!.data![index],
                ),
                itemCount: cubit.categoriesDetails!.data!.data!.length,
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
