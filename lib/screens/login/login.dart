import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:near_era/data/controllers/location_controller.dart';
import 'package:near_era/utils/common.dart';

import './signup.dart';
import '../../utils/constant.dart';
import '../../utils/const_color.dart';
import '../../data/controllers/loading_controller.dart';
import '../../data/auth/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final loadingController = Get.put(LoadingController());
  final locationController = Get.put(LocationController());


  String? _email;
  String? _password;

  void _save() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        Authentication.loginUserFromFirebase(
            email: _email!.trim(), password: _password!.trim());
      } catch (error) {
        const errorMessage = 'Internet connection too slow';
        toast(errorMessage);
      }
    }
  }

  @override
  void initState() {
    locationController.getLatAndLong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/login_background.png',height: mq.height,width: mq.width,fit: BoxFit.cover,),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 100,left: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: mq.height * 0.2,
                    width: mq.width * 0.5,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildEmailField(mq),
                        buildPasswordField(mq),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<LoadingController>(
                    builder: (_) {
                      return loadingController.isLoading == true
                          ? const SpinKitFadingFour(color: kPrimaryColor)
                          : buildLogInButton(mq);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Or',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildSignUpButton(mq),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: mq.height * 0.15,
          //   left: mq.width * 0.25,
          //   child: SizedBox(
          //     height: mq.height * 0.2,
          //     width: mq.width * 0.5,
          //     child: Image.asset(
          //       'assets/images/logo.png',
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: 1,
          //   right: 1,
          //   bottom: mq.height * 0.18,
          //   child: Column(
          //     children: [
          //       Form(
          //         key: _formKey,
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             buildEmailField(mq),
          //             buildPasswordField(mq),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       GetBuilder<LoadingController>(
          //         builder: (_) {
          //           return loadingController.isLoading == true
          //               ? const SpinKitFadingFour(color: kPrimaryColor)
          //               : buildLogInButton(mq);
          //         },
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       const Text(
          //         'Or',
          //         style: TextStyle(
          //           color: Colors.black54,
          //           fontSize: 17,
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       buildSignUpButton(mq),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildEmailField(Size mq) {
    return Container(
      width: mq.width * 0.85,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        style: textStyle(),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          hintText: 'Email',
          hintStyle: hintStyle(),
          border: border(),
          focusedBorder: focusedBorder(),
        ),
        // ignore: missing_return
        validator: (_value) {
          if (_value!.isEmpty) {
            return kEmailNullError;
          }
          bool emailValid = emailValidatorRegExp.hasMatch(_value);
          if (!emailValid) {
            return kInvalidEmailError;
          }
        },
        onSaved: (_value) {
          _email = _value;
        },
      ),
    );
  }

  Widget buildPasswordField(Size mq) {
    return Container(
      width: mq.width * 0.85,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        style: textStyle(),
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          hintText: 'Password',
          hintStyle: hintStyle(),
          border: border(),
          focusedBorder: focusedBorder(),
        ),
        // ignore: missing_return
        validator: (_value) {
          if (_value!.isEmpty) {
            return kPassNullError;
          }
        },
        onSaved: (_value) {
          _password = _value;
        },
      ),
    );
  }

  Widget buildLogInButton(Size mq) {
    return SizedBox(
      width: mq.width * 0.45,
      height: 50,
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          side: const BorderSide(color: Color.fromRGBO(222, 222, 222, 1)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: _save,
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 18.5,
            letterSpacing: 1,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildSignUpButton(Size mq) {
    return SizedBox(
      width: mq.width * 0.45,
      height: 50,
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          elevation: 0,
          side: const BorderSide(color: Color.fromRGBO(222, 222, 222, 1)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          Get.off(() => SignUpScreen());
        },
        child: const Text(
          'SignUp',
          style: TextStyle(
            fontSize: 18.5,
            letterSpacing: 1,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
