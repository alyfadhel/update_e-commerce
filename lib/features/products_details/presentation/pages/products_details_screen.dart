import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:review_shop_app/features/products_details/presentation/widgets/build_products_details.dart';


class ProductsDetailsScreen extends StatelessWidget {
  final int id;

  const ProductsDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<ShopCubit>()
        ..getProductsDetails(
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
              condition: cubit.productsDetails != null,
              builder: (context) => BuildProductsDetailsScreen(
                model: cubit.productsDetails!,
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
