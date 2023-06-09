import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/features/categories_details/presentation/pages/categories_details_screen.dart';
import 'package:review_shop_app/features/home/domain/entities/categories.dart';
import 'package:shimmer/shimmer.dart';

class BuildCategoriesItems extends StatelessWidget {
  final CategoriesDataDetails model;

  const BuildCategoriesItems({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoriesDetailsScreen(id: model.id!),
                  ),
                );
              },
              child: Container(
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
                        height: AppSize.s150,
                        width: AppSize.s150,
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
                      width: AppSize.s20,
                    ),
                    Expanded(
                      child: Text(
                        model.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 16.5),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
