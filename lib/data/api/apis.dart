import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:near_era/data/api/constants.dart';
import 'package:near_era/data/api/utils.dart';
import 'package:near_era/data/auth/authentication.dart';
import 'package:near_era/utils/common.dart';

class Apis {
  final constant = ApiConstants();
  final utils = ApiUtils();
  final uid = Authentication().getUid();


  // Future<BaseResponse?> saveUserPref(String? name,String lat,String long) async {
  //   final request = utils.createPostRequest(constant.saveUserLocationUrl());
  //
  //   request.headers.addAll(constant.getHeader());
  //
  //   request.body = json.encode({
  //     constant.paramName: name,
  //     constant.paramLongitude: long,
  //     constant.paramLatitude: lat,
  //   });
  //
  //   printLog(request);
  //   http.StreamedResponse response = await request.send();
  //
  //   try {
  //     if (response.statusCode == 200) {
  //       final data = await response.stream.bytesToString();
  //       printLog(data);
  //       return BaseResponse.fromJson(jsonDecode(data));
  //     } else {
  //       printLog(response.reasonPhrase);
  //       return null;
  //     }
  //   } catch (e) {
  //     printLog(e);
  //     return null;
  //   }
  // }





}
