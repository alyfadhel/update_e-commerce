import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/features/cart/domain/entities/get_cart.dart';
import 'package:shimmer/shimmer.dart';


class BuildItemsCart extends StatelessWidget {
  final CartItems model;

  const BuildItemsCart({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: AppSize.s150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppSize.s10,
                  ),
                  color: ColorManager.grey.withOpacity(
                    .5,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          AppSize.s10,
                        ),
                      ),
                      child: CachedNetworkImage(
                        width: AppSize.s120,
                        height: AppSize.s150,
                        fit: BoxFit.cover,
                        imageUrl: model.product.image,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(.3),
                          highlightColor: Colors.grey.withOpacity(.5),
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
                    const SizedBox(
                      width: AppSize.s10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          AppPadding.p10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.product.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    '${model.product.price!.round()}',
                                    style:
                                    Theme.of(context).textTheme.titleMedium!.copyWith(
                                      fontSize: AppSize.s15,
                                      color: ColorManager.bTwitter,
                                    ),
                                  ),
                                ),

                                if (model.product.discount != 0)
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      '${model.product.oldPrice.round()}',
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
                                    cubit.changeCart(id: model.product.id);
                                  },
                                  icon: CircleAvatar(
                                    radius: AppSize.s18,
                                    backgroundColor:
                                    cubit.inCart[model.product.id]!
                                        ? ColorManager.mGreen
                                        : ColorManager.grey.withOpacity(.8),
                                    child: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                      size: AppSize.s18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
