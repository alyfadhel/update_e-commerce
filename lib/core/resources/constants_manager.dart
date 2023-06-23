import 'package:flutter/material.dart';
import 'package:review_shop_app/core/service/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/user/login/presentation/pages/login_screen.dart';

class Constants {

  void signOut(context)async
  {
    sl<SharedPreferences>().remove('token').then((value)
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),);
    });
  }
}