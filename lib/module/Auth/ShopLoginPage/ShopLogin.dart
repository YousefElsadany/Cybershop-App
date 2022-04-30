// ignore_for_file: avoid_unnecessary_containers

import 'package:cybershop_app/layout/ShopLayout.dart';
import 'package:cybershop_app/module/Auth/AuthViewModel/AuthViewModel.dart';
import 'package:cybershop_app/module/Auth/LoginWithPhone.dart';
import 'package:cybershop_app/module/Auth/RegisterPage/ShopRegister.dart';
import 'package:cybershop_app/shared/componants/componants.dart';
import 'package:cybershop_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginShopScreen extends GetWidget<AuthViewModel> {
  const LoginShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: authBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: authBackgroundColor,
      ),
      backgroundColor: authBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Welcome,',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(const ShopRegisterScreen());
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: shopColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const Text(
                              'Sign in to Continue',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xff929292),
                              ),
                            ),
                            const SizedBox(
                              height: 38.0,
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              'Email',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontSize: 14.0,
                                color: const Color(0xff929292),
                              ),
                            ),
                            customTextFeild(
                              controller: emailController,
                              inputType: TextInputType.emailAddress,
                              title: 'example@gmail.com',
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Email Required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 38.0,
                            ),
                            const Text(
                              'Password',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xff929292),
                              ),
                            ),
                            customTextFeild(
                              controller: passwordController,
                              inputType: TextInputType.visiblePassword,
                              title: '●●●●●●●●●●●●',
                              isPassword: true,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Password Required';
                                } else if (value.length < 6) {
                                  return 'Password less than 6 charchtar ';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forget Password?',
                              textAlign: TextAlign.end,
                              // ignore: unnecessary_const
                              style: const TextStyle(
                                color: Color.fromARGB(190, 0, 0, 0),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                        customButtom(
                            buttomCollor: shopColor,
                            buttomWidth: double.infinity,
                            text: 'LOGIN',
                            press: () {
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate()) {
                                controller.signinWithEmalilAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                Get.offAll(const ShopLayout());
                              }
                            }),
                      ],
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 28.0,
                ),
                const Text(
                  '-OR-',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                InkWell(
                  onTap: () {
                    //controller.signinWithFacebook();
                    Get.to( PhoneLogin());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: const Color(
                          0xffdddddd,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/facebook.png',
                            cacheHeight: 25,
                            cacheWidth: 25,
                          ),
                          const Text(
                            'Sign In with Facebook',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    controller.signinWithGoogle();
                    Get.offAll(const ShopLayout());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: const Color(
                          0xffdddddd,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                            cacheHeight: 25,
                            cacheWidth: 25,
                          ),
                          const Text(
                            'Sign In with Google',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
