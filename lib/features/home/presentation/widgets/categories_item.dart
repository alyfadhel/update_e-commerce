import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/features/categories_details/presentation/pages/categories_details_screen.dart';
import 'package:review_shop_app/features/home/domain/entities/categories.dart';
import 'package:shimmer/shimmer.dart';

class BuildHomeCategories extends StatelessWidget {
  final CategoriesDataDetails categories;

  const BuildHomeCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesDetailsScreen(id: categories.id!),
          ),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
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
              imageUrl: categories.image!,
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
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            width: AppSize.s150,
            decoration: BoxDecoration(
              color: ColorManager.sBlack.withOpacity(.5),
            ),
            child: Text(
              categories.name!,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: ColorManager.sWhite),
            ),
          ),
        ],
      ),
    );
  }
}
