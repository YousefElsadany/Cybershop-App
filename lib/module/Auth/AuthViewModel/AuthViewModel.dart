import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cybershop_app/model/UserModel.dart';
import 'package:cybershop_app/shared/componants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FacebookLogin _facebookSignIn = FacebookLogin();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn<User>();
  late String verificationCode;
  String countryKey = "+20";

  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }



  void signinWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential);
    printFullText(googleUser.toString());
  }

  void signinWithFacebook() async {
    final res = await _facebookSignIn.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    final resu = await _facebookSignIn.expressLogin();

    if (resu.status == FacebookLoginStatus.success) {
      final FacebookAccessToken? accessToken = resu.accessToken;
      print('Access token: ${accessToken!.token}');
    }
    // final FacebookAccessToken? accessToken = res.accessToken;
    // if (res.status == FacebookLoginStatus.success) {
    //   final faceCredential =
    //       FacebookAuthProvider.credential(accessToken!.token);
    //   await _auth.signInWithCredential(faceCredential);
    //   printFullText(res.toString());
    // }
    // switch (res.status) {
    //   case FacebookLoginStatus.success:
    //     final FacebookAccessToken? accessToken = res.accessToken;
    //     print('Access token: ${accessToken!.token}');

    //     final profile = await _facebookSignIn.getUserProfile();
    //     print('Hello, ${profile!.name}! You ID: ${profile.userId}');

    //     final imageUrl = await _facebookSignIn.getProfileImageUrl(width: 100);
    //     print('Your profile image: $imageUrl');

    //     final email = await _facebookSignIn.getUserEmail();
    //     if (email != null) print('And your email is $email');

    //     break;
    //   case FacebookLoginStatus.cancel:
    //     break;
    //   case FacebookLoginStatus.error:
    //     print('Error while log in: ${res.error}');
    //     break;
    // }
  }

  UserModel? userModel;

  void signinWithEmalilAndPassword({
    required String email,
    required String password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print('LOGIN SUCCESS ' + value.user!.uid);
      print(value.user!.uid);
    }).catchError((error) {
      print('ERROR LOGIN' + error.toString());
    });
  }

  void userSignUp({
    required String name,
    required String email,
    required String password,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
        name: name,
        email: email,
        uid: value.user!.uid,
      );
    }).catchError((error) {
      print('ERROR SIGNUP' + error.toString());
    });
  }

  void createUser({
    required String name,
    required String email,
    required String uid,
  }) {
    UserModel? model = UserModel(
      uid: uid,
      name: name,
      email: email,
      image: 'https://i.stack.imgur.com/l60Hf.png',
      cover:
          'https://image.freepik.com/free-photo/studio-shot-positive-african-american-woman-points-finger-copy-space-excited-by-good-information-smiles-pleasantly-wears-yellow-jacket-stands-ripped-paper-hole_273609-33954.jpg',
      bio: 'Write your bio ...',
      isEmailVerify: false,
    );

    FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .set(
          model.toMap(),
        )
        .then((value) {
      // print(value.user!.email);
      // print(value.user!.uid);
    }).catchError((error) {
      print('ERROR CREATE USER' + error.toString());
    });
  }

  IconData suffinx = Icons.visibility;
  bool isShow = true;

  void changePasswordIcon() {
    isShow = !isShow;
    suffinx = isShow ? Icons.visibility : Icons.visibility_off;
  }

  // SignIn Using Phone Number

  Future<void> signinWithPhoneNumber(String phoneNum) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "$countryKey$phoneNum",
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSentToUser,
      timeout: const Duration(seconds:25),
      codeAutoRetrievalTimeout:codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    await userSignIn(credential);
  }

  void verificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }
  }

  void codeSentToUser(String verificationID, int? reSentCode) {
    verificationCode = verificationID;
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    verificationCode = verificationId;

  }

  Future<void> submitOtbCode(String otpCode) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationCode, smsCode: otpCode);

    await userSignIn(phoneAuthCredential);
  }

  Future<void> userSignIn(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
