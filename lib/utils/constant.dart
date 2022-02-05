import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:near_era/utils/const_color.dart';


const ATLAS_ID = "33OkryzDZsKP4TUJLGG6OveBEG21Zo55_xXweXY9ThqJDJcxclNFCH-dqiSQ13Z4NT5kDK5SLxMnUEs4OpG6mA==";
const ATLAS_SECRET = "lrFxI-iSEg9e6bwisC7BT1uwSD8ZmWrsgn6IovnXDNfqrKUc9LA-r0YcMHBk-Cs_pcYsO_YOOmUEvFYSfyP_DYM05uTrJ_Fh";
const REST_API_KEY = "9d7eb743d7c26f34ae0e02d9d5548463";
const ACCESS_TOKEN = "687afc64-2dfc-4c80-bd35-236d5826a337";


final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter valid Email";
const String kPassNullError = "Please enter your password";
const String kShortPassError =
    "Password length should be more than five\neg: 123456";
const String kNameNullError = "Please enter your name";

TextStyle textStyle() {
  return const TextStyle(
    fontSize: 15,
    color: Colors.black,
  );
}

TextStyle hintStyle() {
  return const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 15,
    color: Colors.grey,
  );
}

InputBorder border() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(
      color: Color.fromRGBO(222, 222, 222, 1),
    ),
  );
}

InputBorder focusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(
      width: 1.5,
      color: kPrimaryColor,
    ),
  );
}
