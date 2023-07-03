import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/network/end_points.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/resources/values_manager.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:review_shop_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:review_shop_app/features/search/presentation/pages/search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';



class ShopLayout extends StatefulWidget {
  const ShopLayout({Key? key}) : super(key: key);


  @override
  State<ShopLayout> createState() => _ShopLayoutState();
}
late StreamSubscription subscription;
bool isDeviceConnected = false;
bool isAlertSet = false;

class _ShopLayoutState extends State<ShopLayout> {
  @override
  void initState() {
    getConnectivity();
    super.initState();
  }
  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );
  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text('Please check your internet connectivity'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected && isAlertSet == false) {
              showDialogBox();
              setState(() => isAlertSet = true);
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
  // @override
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.title[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                iconSize: 40.0,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                icon: Stack(
                  //alignment: AlignmentDirectional.topStart,
                  //fit: StackFit.passthrough,
                  children: [
                    Icon(Icons.shopping_cart_outlined,
                        color: ColorManager.grey.withOpacity(.6)),
                    if (cubit.cartItem != null)
                      CircleAvatar(
                        radius: AppSize.s9,
                        backgroundColor: ColorManager.lightRed,
                        child: Text(
                          cubit.cartItem!.length > 9
                              ? '+9'
                              : '${cubit.cartItem!.length}',
                          style: const TextStyle(
                            color: ColorManager.sWhite,
                            fontSize: AppSize.s11,
                          ),
                        ),
                      )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeLanguage();
                  sl<SharedPreferences>()
                      .setString('language', language)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(
                          startWidget: const ShopLayout(),
                          isDark: cubit.isDark,
                        ),
                      ),
                    );
                  });
                },
                icon: CircleAvatar(
                  radius: 16.0,
                  backgroundColor: ColorManager.grey,
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white,
                    child: Text(
                      language.toUpperCase(),
                      style: const TextStyle(
                        color: ColorManager.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeThemeMode();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: cubit.items,
          ),
        );
      },
    );
  }
}