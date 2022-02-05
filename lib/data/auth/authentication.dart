import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:near_era/utils/common.dart';

import '../controllers/loading_controller.dart';
import '../../screens/home/bottom_nav_screen.dart';

final _auth = FirebaseAuth.instance;
final controller = Get.put(LoadingController());

class Authentication {
  static Future<void> loginUserFromFirebase(
      {String? email, String? password}) async {
    try {
      controller.toggleLoading();

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);

      User user = userCredential.user!;

      if (user != null) {
        toast('LoggedIn Successfully!');

        controller.toggleLoading();

        Get.off(() => BottomNavScreen());
      }
    } catch (error) {
      print(error);

      var errorMessage = 'Failed! Try again Later';
      if (error.toString().contains('password is invalid')) {
        errorMessage = 'Opps! Wrong Password';
      } else if (error.toString().contains('ERROR_TOO_MANY_REQUESTS')) {
        errorMessage = 'Too many requests. Try again Later!';
      } else if (error.toString().contains('no user record corresponding')) {
        errorMessage = 'User not Registered';
      } else if (error.toString().contains('A network error')) {
        errorMessage = 'Network error';
      }

      controller.toggleLoading();

      toast(errorMessage);
    }
  }

  static Future<void> signUpUserFromFirebase(
      {String? email, String? password}) async {
    try {
      controller.toggleLoading();

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      User user = userCredential.user!;

      if (user != null) {
        controller.toggleLoading();

        Get.off(() => const BottomNavScreen());
      }
    } catch (error) {
      print(error);

      var errorMessage = 'Failed! Try again Later';
      if (error.toString().contains('ERROR_TOO_MANY_REQUESTS')) {
        errorMessage = 'Too many requests. Try again Later!';
      } else if (error.toString().contains('email address is already in use')) {
        errorMessage = 'User Already Registered';
      } else if (error
          .toString()
          .contains('Password should be at least 6 characters')) {
        errorMessage = 'Password too short';
      } else if (error.toString().contains('A network error')) {
        errorMessage = 'Network error';
      }

      controller.toggleLoading();
      toast(errorMessage);
    }
  }

  static Future<void> signOut() async {
    return await _auth.signOut();
  }

  static Future resetPasswordWithEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<bool> isLoggedIn() async {
    if (_auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<String?> getUid() async {
    if (await isLoggedIn()) {
      return _auth.currentUser!.uid;
    }
    return null;
  }
}
