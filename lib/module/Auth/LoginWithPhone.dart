import 'package:country_code_picker/country_code_picker.dart';
import 'package:cybershop_app/module/Auth/AuthViewModel/AuthViewModel.dart';
import 'package:cybershop_app/module/Auth/Validation.dart';
import 'package:cybershop_app/module/Auth/loading_dialog.dart';
import 'package:cybershop_app/shared/componants/componants.dart';
import 'package:cybershop_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PhoneLogin extends GetWidget<AuthViewModel> {
  var phoneController =  TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? phoneNumber ;
  PhoneLogin({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customHeader("Welcome", "Continue with Phone number"),
              buildPhoneFormField(context, phoneController, phoneNumber),
              customButtom(
                buttomCollor: shopColor,
                text: "Confirm",
                press: ()  {
                  showLoadingDialog(context);
                   submitPhone(context);
                },
                buttomWidth: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );

  }
  Future<void> submitPhone(BuildContext context) async {
    if (formKey.currentState!.validate())  {

      formKey.currentState!.save();
      controller.signinWithPhoneNumber(phoneController.text);
      Get.to(Validation( phoneNumber:phoneController.text,));
    }
  }


Widget customHeader(String header, String title) => Container(
      margin: const EdgeInsetsDirectional.only(top: 9, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(title, style: const TextStyle(fontSize: 16))
        ],
      ),
    );

Widget buildPhoneFormField(BuildContext context,
    TextEditingController textEditingController, String? phoneNumber) {
  var width = MediaQuery
      .of(context)
      .size
      .width * 0.75;
  var height = MediaQuery
      .of(context)
      .size
      .height * 0.65;
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: CountryCodePicker(
          padding: EdgeInsets.zero,
          hideSearch: true,
          onChanged: (code) {
            controller.countryKey = code.dialCode!;
          },
          initialSelection: 'EG',
          favorite: const ['+20', 'EG'],
          dialogTextStyle: const TextStyle(
            //fontSize: 5,
          ),
          textStyle: const TextStyle(
            //fontSize: 19,
          ),
          showCountryOnly: true,
          dialogSize: Size(width, height),
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
        ),
      ),
    ),
    const SizedBox(
      width: 10,
    ),
    Expanded(
      flex: 7,
      child: TextFormField(

        controller: textEditingController,
        autofocus: true,
        style: const TextStyle(
          fontSize: 22,
          letterSpacing: 2.0,
        ),
        decoration: const InputDecoration(
            fillColor: Colors.grey,
            filled: true,
            contentPadding: EdgeInsets.all(10),
            constraints: BoxConstraints(
                maxHeight: double.infinity, maxWidth: double.infinity),
            border: InputBorder.none),
        cursorColor: Colors.black,
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter you phone number!';
          } else if (value.length < 10) {
            return 'Too short for a phone number!';
          }
          return null;
        },

        onSaved: (value) {
          phoneNumber = value;
        },
      ),
    )
  ]);
}

}