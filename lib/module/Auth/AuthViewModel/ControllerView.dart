import 'package:cybershop_app/layout/ShopLayout.dart';
import 'package:cybershop_app/module/Auth/AuthViewModel/AuthViewModel.dart';
import 'package:cybershop_app/module/Auth/ShopLoginPage/ShopLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? const ShopLayout()
          : const LoginShopScreen();
    });
  }
}
