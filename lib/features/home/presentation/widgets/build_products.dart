import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/features/home/domain/entities/home.dart';
import 'package:review_shop_app/features/products_details/presentation/pages/products_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class BuildProducts extends StatelessWidget {
  final Products products;

  const BuildProducts({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  debugPrint(products.id.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsDetailsScreen(
                        id: products.id!.toInt(),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.s10,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            AppSize.s20,
                          ),
                        ),
                        child: CachedNetworkImage(
                          width: AppSize.s150,
                          height: AppSize.s150,
                          imageUrl: products.image!,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(.5),
                            highlightColor: Colors.grey.withOpacity(.3),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(AppSize.s8),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      if (products.discount != 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: const Text(
                            'DISCOUNT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    products.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(
                          '${products.price.round()}',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: AppSize.s15,
                                    color: ColorManager.bTwitter,
                                  ),
                        ),
                      ),

                      if (products.discount != 0)
                        Expanded(
                          flex: 5,
                          child: Text(
                            '${products.oldPrice.round()}',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color: ColorManager.red,
                                      fontSize: AppSize.s12,
                                    ),
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          cubit.changeFavoritesItems(productId: products.id!);
                        },
                        icon: CircleAvatar(
                          radius: 14.0,
                          backgroundColor:
                              cubit.favoritesProducts[products.id] == true
                                  ? ColorManager.bTwitter
                                  : ColorManager.grey,
                          child: const Icon(
                            Icons.favorite_border,
                            size: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
