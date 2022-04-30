import 'package:cybershop_app/module/Auth/AuthViewModel/AuthViewModel.dart';
import 'package:cybershop_app/module/Auth/RegisterPage/ShopRegister.dart';
import 'package:cybershop_app/shared/componants/componants.dart';
import 'package:cybershop_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Validation extends GetWidget<AuthViewModel> {
  TextEditingController validationController = TextEditingController();
  final String phoneNumber;
  late String otpCode;

  Validation({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    //String code = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            //margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.05,
                left: 16,
                right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Validation Code",
                  style: TextStyle(fontSize: 26),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text:  TextSpan(
                    text:
                        'An activation code has been sent to your number\n',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text: phoneNumber,
                          style: TextStyle(fontSize: 16, color: shopColor)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 44,
                ),
                Container(
                  //color: Colors.blue,
                  margin: const EdgeInsets.only(left: 9),
                  child: const Text("Enter Validation Code",
                      style: TextStyle(fontSize: 14)),
                ),
                const SizedBox(
                  height: 18,
                ),
                buildPinCodeContainer(context),
                const SizedBox(
                  height: 38,
                ),
                customButtom(
                  buttomCollor: shopColor,
                  text: "Confirm",
                  press: () {
                    controller.submitOtbCode(otpCode);
                    Get.to(ShopRegisterScreen());
                    print(otpCode + 'Success');
                  },
                  buttomWidth: double.infinity,
                ),
                const SizedBox(
                  height: 73,
                ),
                const Center(
                  child: Text(
                    "Didn’t receive an activation code?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                reSend("Resend")
              ],
            )),
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 26,
        height: 86,
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
            //color: Color(0xfff6f5fa),
            image:
                DecorationImage(image: AssetImage('assets/images/empty.png')),
            //borderRadius: BorderRadius.all(Radius.circular(15)),
            /* boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75),
                )
              ] */
          ),
          child: Text(
            codeNumber,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1F1F),
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }

  Widget reSend(String reSend) => InkWell(
        /* onTap: () {
        Get.offAll(Login());
        Get.snackbar(
          "Successful ",
          "Now , you can Login",
          backgroundColor: Colors.white,
          colorText: Colors.black,
          boxShadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        );
      }, */
        child: Container(
          margin: const EdgeInsets.only(right: 65, left: 65),
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Text(
            reSend,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      );

  Widget buildPinCodeContainer(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      appContext: context,
      obscureText: false,
      animationType: AnimationType.scale,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 50,
          activeFillColor: Colors.blue[100],
          inactiveFillColor: CustomColors.colorGrey,
          borderWidth: 1,
          selectedFillColor: CustomColors.googleBackground,
          inactiveColor: shopColor,
          activeColor:CustomColors.colorAmber,
          selectedColor: CustomColors.colorYellow),
      animationDuration: const Duration(milliseconds: 300),
      //backgroundColor: CustomColors.backgroundColor,
      enableActiveFill: true,
      controller: validationController,
      onCompleted: (code) {
        otpCode = code;
      },
      onChanged: (value) {
      },
    );
  }
}
