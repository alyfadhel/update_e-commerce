import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/features/categories_details/domain/entities/categories_details.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

var imageController = PageController();
var carouselController = CarouselController();
int current = 0;
class BuildCategoriesDetailsScreen extends StatefulWidget {
  final CategoriesDataDetailsData model;
  const BuildCategoriesDetailsScreen({super.key,required this.model});

  @override
  State<BuildCategoriesDetailsScreen> createState() => _BuildCategoriesDetailsScreenState();
}

class _BuildCategoriesDetailsScreenState extends State<BuildCategoriesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
              items: widget.model.images!
                  .map(
                    (e) => ClipRRect(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s20)),
                  child: CachedNetworkImage(
                    imageUrl: e,
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
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            AnimatedSmoothIndicator(
              activeIndex: current,
              count: widget.model.images!.length,
              effect: const JumpingDotEffect(
                dotHeight: 10,
                dotWidth: 10,
                jumpScale: .7,
                verticalOffset: 20,
                activeDotColor: Colors.indigo,
                dotColor: Colors.grey,
              ),
              onEnd: () {
                current = 0;
              },
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Text(
              widget.model.name.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Row(
              children: [
                Text(
                  widget.model.price.round().toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: ColorManager.bTwitter,
                  ),
                ),
                const SizedBox(
                  width: AppSize.s40,
                ),
                if (widget.model.discount != 0)
                  Text(
                    widget.model.oldPrice.round().toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.red,
                        decoration: TextDecoration.lineThrough),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
