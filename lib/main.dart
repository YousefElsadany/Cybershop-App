import 'package:cybershop_app/module/Auth/AuthViewModel/ControllerView.dart';
import 'package:cybershop_app/shared/network/local/CachHelper.dart';
import 'package:cybershop_app/shared/network/remote/Bainding.dart';
import 'package:cybershop_app/shared/style/Themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await CacheHelper.init();
  await Firebase.initializeApp();
  late bool? isDark = CacheHelper.getData(key: 'isDark');

  late bool? isBoarding = CacheHelper.getData(key: 'onBoarding');

  runApp(MyApp(
    isDark: (isDark != null) ? isDark : false,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: const ControlView(),
    );
  }
}
