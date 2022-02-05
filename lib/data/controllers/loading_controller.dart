import 'package:get/get.dart';

class LoadingController extends GetxController {
  var isLoading = false;

  void toggleLoading() {
    if (isLoading == false) {
      isLoading = true;
    } else {
      isLoading = false;
    }
    update();
  }
}
