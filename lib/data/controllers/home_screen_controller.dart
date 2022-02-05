import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

import 'package:near_era/utils/constant.dart';

class HomeScreenController extends GetxController {
  MapmyIndiaMapController? mapMyIndiaMapController;

  @override
  void onInit() {
    MapmyIndiaAccountManager.setMapSDKKey(ACCESS_TOKEN);
    MapmyIndiaAccountManager.setRestAPIKey(REST_API_KEY);
    MapmyIndiaAccountManager.setAtlasClientId(ATLAS_ID);
    MapmyIndiaAccountManager.setAtlasClientSecret(ATLAS_SECRET);
    super.onInit();
  }

  addMarkerToMap(double? lat, double? long, Color? color) async {
    await mapMyIndiaMapController?.addSymbol(
        SymbolOptions(geometry: LatLng(lat!, long!), iconColor: '#3bb2d0'));
  }


}
