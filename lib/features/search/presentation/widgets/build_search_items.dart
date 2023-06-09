import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/features/search/domain/entities/search.dart';
import 'package:shimmer/shimmer.dart';

class BuildSearchItems extends StatelessWidget {
  final SearchDetailsData model;
  const BuildSearchItems({super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Container(
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
                  imageUrl: model.image!,
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
                        model.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            model.price!.round().toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                              color: ColorManager.bTwitter,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              // print(products.id!);
                              cubit.changeFavoritesItems(productId: model.id!);
                            },
                            icon: CircleAvatar(
                              radius: 15.0,
                              backgroundColor:
                              cubit.favoritesProducts[model.id!] == true
                                  ? ColorManager.bTwitter
                                  : ColorManager.grey,
                              child: const Icon(
                                Icons.favorite_border,
                                size: 14.0,
                                color: Colors.white,
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
        );
      },
    );
  }
}
