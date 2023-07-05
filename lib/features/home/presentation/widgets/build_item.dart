import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/strings_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/features/home/domain/entities/home.dart';
import 'package:review_shop_app/features/home/presentation/pages/categories_home_screen.dart';
import 'package:review_shop_app/features/home/presentation/widgets/build_products.dart';
import 'package:shimmer/shimmer.dart';

var controller = ScrollController();

class BuildItem extends StatelessWidget {
  final Home home;

  const BuildItem({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      trackVisibility: true,
      thickness: 8,
      controller: controller,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: home.data!.banners!
                    .map(
                      (e) => ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(AppSize.s20)),
                        child: CachedNetworkImage(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl: e.image!,
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
                    )
                    .toList(),
                options: CarouselOptions(
                  height: AppSize.s220,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                )),
            const SizedBox(
              height: AppSize.s30,
            ),
            Padding(
              padding: const EdgeInsets.all(
                AppPadding.p15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.categories,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: ColorManager.sBlack,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  const CategoriesHomeScreen(),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  Text(
                    AppStrings.newProducts,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: ColorManager.sBlack,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1/1.8,
                    children: List.generate(
                      home.data!.products!.length,
                          (index) => BuildProducts(
                        products: home.data!.products![index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
