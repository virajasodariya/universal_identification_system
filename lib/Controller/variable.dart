import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  /// forgot password controller

  static final emailForgotPassword = TextEditingController();
  static final mobileNumberForgotPassword = TextEditingController();

  /// new password controller

  static final passwordNewPassword = TextEditingController();
  static final confirmPasswordNewPassword = TextEditingController();

  /// profile

  static final nameProfile = TextEditingController();
  static final emailProfile = TextEditingController();
  static final phoneNumberProfile = TextEditingController();
  static final locationProfile = TextEditingController();

  ///

  static PageController controller = PageController();

  ///

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
