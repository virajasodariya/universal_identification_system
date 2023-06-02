import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariableController extends GetxController {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final mobileNumberController = TextEditingController();
  static final nameController = TextEditingController();
  static final nameOfTheDeceasedController = TextEditingController();
  static final dateOfDeathController = TextEditingController();
  static final placeOFDeathController = TextEditingController();
  static final numberOnTheUISBraceletController = TextEditingController();
  static final dateTimeAttachedController = TextEditingController();
  static final printedController = TextEditingController();
  static final signatureController = TextEditingController();
  static final dateTimeController = TextEditingController();
  static final relationshipController = TextEditingController();

  ///

  static PageController controller = PageController();

  ///

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    mobileNumberController.dispose();
    nameController.dispose();
    nameOfTheDeceasedController.dispose();
    dateOfDeathController.dispose();
    placeOFDeathController.dispose();
    numberOnTheUISBraceletController.dispose();
    dateTimeAttachedController.dispose();
    printedController.dispose();
    signatureController.dispose();
    dateTimeController.dispose();
    relationshipController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
