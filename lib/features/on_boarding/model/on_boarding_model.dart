import 'package:review_shop_app/core/resources/assets_manager.dart';
import 'package:review_shop_app/core/resources/strings_manager.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

List<OnBoardingModel> boarding = [
  OnBoardingModel(
    image: ImageAssets.image1,
    title: AppStrings.onBoardingTitle1,
    body: AppStrings.onBoardingBody1,
  ),
  OnBoardingModel(
    image: ImageAssets.image2,
    title: AppStrings.onBoardingTitle2,
    body: AppStrings.onBoardingBody2,
  ),
  OnBoardingModel(
    image: ImageAssets.image3,
    title: AppStrings.onBoardingTitle3,
    body: AppStrings.onBoardingBody3,
  ),
];
