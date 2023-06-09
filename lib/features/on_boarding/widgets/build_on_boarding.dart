import 'package:flutter/material.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/features/on_boarding/model/on_boarding_model.dart';

class BuildOnBoarding extends StatelessWidget {
  final OnBoardingModel model;
  const BuildOnBoarding({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Expanded(
            child: Image(
              image: AssetImage(
                model.image,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s30,
          ),
          Text(
            model.title,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Text(
            model.body,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
