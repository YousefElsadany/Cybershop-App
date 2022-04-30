import 'package:cybershop_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget customButtom({
  required Color buttomCollor,
  double? buttomWidth,
  required String text,
  required Function()? press,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: buttomCollor,
      ),
      width: buttomWidth,
      child: MaterialButton(
        onPressed: press,
        child: Text(
          text.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget customTextFeild({
  Color textColor = shopColor,
  required TextEditingController controller,
  required TextInputType inputType,
  required String title,
  IconData? pIcon,
  bool isPassword = false,
  IconData? sIcon,
  String? Function(String?)? validate,
  Function()? tap,
  String? Function(String?)? change,
  String? Function(String?)? Submit,
  suffixPress,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      validator: validate,
      onChanged: change,
      onFieldSubmitted: Submit,
      onTap: tap,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: shopColor,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffdddddd),
          ),
        ),
        labelText: title,
        labelStyle: TextStyle(color: Colors.grey[500]),
        suffixStyle: TextStyle(backgroundColor: Colors.grey[700]),
        suffixIcon: IconButton(
          icon: Icon(
            sIcon,
            color: shopColor,
          ),
          onPressed: suffixPress,
        ),
      ),
    );

Widget customLine({double margin = 0.0}) => Container(
      color: Colors.grey[300],
      width: double.infinity,
      height: 1,
      padding: const EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: margin),
    );

void showTast({required String? text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  // ignore: dead_code
  return color;
}

Widget customEmptyPage({
  required String imagePath,
  required double width,
  required double height,
  required String text,
}) =>
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: width,
            height: height,
            //fit: BoxFit.cover,
          ),
          Text(
            'Nothing !!',
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.grey[800],
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );

// Widget customCartIcon(
//         {required Function() onTap,
//         required Color color,
//         required String text}) =>
//     InkWell(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(10.0),
//             bottomLeft: Radius.circular(10.0),
//           ),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
//         margin: EdgeInsets.symmetric(vertical: 5.0),
//         child: Text(
//           text,
//           style: TextStyle(fontSize: 12.0, color: Colors.white),
//         ),
//       ),
//     );
//
// Widget customCartBottom({
//   required onTap,
//   BorderRadius? circulRadius,
//   double? width,
//   double? height,
//   required String text,
//   required Color color,
//   required Color textColor,
//   required Color circulAvatarColor,
//   required Color iconColor,
//   required IconData icon,
// }) =>
//     InkWell(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: circulRadius,
//           color: color,
//         ),
//         width: width,
//         height: height,
//         padding: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0, left: 24.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               text,
//               style: TextStyle(
//                 color: textColor,
//                 fontWeight: FontWeight.w900,
//                 fontSize: 14.0,
//               ),
//             ),
//             SizedBox(
//               width: 10.0,
//             ),
//             CircleAvatar(
//               radius: 15.0,
//               backgroundColor: circulAvatarColor,
//               child: Icon(
//                 icon,
//                 color: iconColor,
//                 size: 18.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
// Widget buildThings({
//   required onPressed,
//   required IconData icon,
//   required String text,
// }) =>
//     InkWell(
//       onTap: onPressed,
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             color: Color(0xff727C8E),
//           ),
//           SizedBox(
//             width: 20.0,
//           ),
//           Text(
//             text,
//             style: TextStyle(
//               fontSize: 18,
//               color: Color(0xff515C6F),
//             ),
//           ),
//           Spacer(),
//           IconButton(
//             onPressed: onPressed,
//             icon: Icon(Icons.arrow_forward_ios),
//           ),
//         ],
//       ),
//     );
