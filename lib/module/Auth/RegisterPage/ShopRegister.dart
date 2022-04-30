import 'package:cybershop_app/module/Auth/AuthViewModel/AuthViewModel.dart';
import 'package:cybershop_app/shared/componants/componants.dart';
import 'package:cybershop_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ShopRegisterScreen extends GetWidget<AuthViewModel> {
  const ShopRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: authBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: authBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: authBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
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
                            children: const [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 48.0,
                          ),
                          // ignore: prefer_const_constructors
                          Text(
                            'Name',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Color(0xff929292),
                            ),
                          ),
                          customTextFeild(
                            controller: nameController,
                            inputType: TextInputType.name,
                            title: 'Example Name',
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Name Required';
                              }
                              return null;
                            },
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
                      const SizedBox(
                        height: 60.0,
                      ),
                      customButtom(
                          buttomCollor: shopColor,
                          buttomWidth: double.infinity,
                          text: 'Sign Up',
                          press: () {
                            if (formKey.currentState!.validate()) {
                              controller.userSignUp(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              Get.back();
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
