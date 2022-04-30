import 'package:cybershop_app/module/Auth/ShopLoginPage/ShopLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
        backgroundColor: Colors.white,
        title: InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(32, 163, 162, 162),
              borderRadius: BorderRadius.circular(50.0),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: const [
                  Icon(Icons.search_outlined),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 28,
              ),
              Text(
                'Categories',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 18,
              ),
              FloatingActionButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAll(const LoginShopScreen());
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
