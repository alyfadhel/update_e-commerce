import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:review_shop_app/core/widgets/text_btn.dart';
import 'package:review_shop_app/features/on_boarding/model/on_boarding_model.dart';
import 'package:review_shop_app/features/on_boarding/widgets/build_on_boarding.dart';
import 'package:review_shop_app/features/user/login/presentation/pages/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();
  bool isLast = false;

  onSubmit()
  {
    sl<SharedPreferences>().setBool('onBoarding', true).then((value)
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.sWhite,
      appBar: AppBar(
        backgroundColor: ColorManager.sWhite,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.sWhite,
          statusBarIconBrightness: Brightness.dark
        ),
        elevation: 0,
        actions: [
          MyTextButton(
            onPressed: () {
              onSubmit();
            },
            text: 'Skip',
            colors: ColorManager.bTwitter,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppPadding.p20,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => BuildOnBoarding(
                  model: boarding[index],
                ),
                itemCount: boarding.length,
                controller: boardingController,
              ),
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                    spacing: 4.0,
                    expansionFactor: 1.1,
                    dotWidth: AppSize.s10,
                    dotHeight: AppSize.s10,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.indigo,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      onSubmit();
                    }
                    boardingController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
