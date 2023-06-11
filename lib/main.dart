import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_shop_app/core/layout/cubit/shop_cubit.dart';
import 'package:review_shop_app/core/layout/cubit/shop_state.dart';
import 'package:review_shop_app/core/layout/shop_layout.dart';
import 'package:review_shop_app/core/network/end-points.dart';
import 'package:review_shop_app/core/observer/observer.dart';
import 'package:review_shop_app/core/resources/theme_manager.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:review_shop_app/features/on_boarding/pages/on_boarding.dart';
import 'package:review_shop_app/features/user/login/presentation/pages/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ServiceLocator().init();
  bool? onBoarding = sl<SharedPreferences>().getBool('onBoarding');
  debugPrint(onBoarding.toString());
  token = sl<SharedPreferences>().getString('token');
  debugPrint(token);
  bool? isDark = sl<SharedPreferences>().getBool('isDark');
  String? lang = sl<SharedPreferences>().getString('language');
  lang != null? language = lang : language = 'ar';
  Widget widget;

  if(onBoarding != null){
    if(token != null){
      widget = const ShopLayout();
    }else{
      widget = const LoginScreen();
    }
  }else{
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  final bool? isDark;
  const MyApp({super.key,required this.startWidget, required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> sl<ShopCubit>()..getHomeData()..getCategories()..getFavorites()..changeThemeMode(
        fromShared: isDark,
      )..getCart(),
      child: BlocConsumer<ShopCubit,ShopState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getApplicationLightTheme(),
            darkTheme: getApplicationDarkTheme(),
            themeMode: ShopCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}


