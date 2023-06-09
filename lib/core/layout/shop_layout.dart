import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/network/end-points.dart';
import 'package:review_shop_app/core/resources/color_manager.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:review_shop_app/features/search/presentation/pages/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

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
                onPressed: () {
                  cubit.changeThemeMode();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
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
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: cubit.items,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
