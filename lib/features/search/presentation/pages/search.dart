import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/core/widgets/my_form_field.dart';
import 'package:review_shop_app/features/search/presentation/widgets/build_search_items.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                MyFormField(
                  controller: cubit.searchController,
                  type: TextInputType.text,
                  label: 'search',
                  prefix: Icons.search,
                  validator: (value) {},
                  onChanged: (text) {
                    cubit.getSearch(
                      text: text,
                    );
                  },
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: cubit.search != null,
                    builder: (context) => ListView.separated(
                      itemBuilder: (context, index) => BuildSearchItems(
                        model: cubit.search!.data!.data![index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: AppSize.s20,
                      ),
                      itemCount: cubit.search!.data!.data!.length,
                    ),
                    fallback: (context) => cubit.isSearch ?  const Center(
                      child: CircularProgressIndicator(),
                    ) : Container(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
