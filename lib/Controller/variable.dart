import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  /// login controller

  static final emailLogin = TextEditingController();
  static final passwordLogin = TextEditingController();

  /// forgot password controller

  static final emailForgotPassword = TextEditingController();
  static final mobileNumberForgotPassword = TextEditingController();

  /// new password controller

  static final passwordNewPassword = TextEditingController();
  static final confirmPasswordNewPassword = TextEditingController();

  /// sign up controller

  static final nameSignUp = TextEditingController();
  static final emailSignUp = TextEditingController();
  static final passwordSignUp = TextEditingController();
  static final confirmPasswordSignUp = TextEditingController();

  /// form 1

  static final nameOfTheDeceasedForm1 = TextEditingController();
  static final dateOfDeathForm1 = TextEditingController();
  static final placeOfDeathForm1 = TextEditingController();
  static final numberOnTheUISBraceletForm1 = TextEditingController();
  static final dateTimeAttachedForm1 = TextEditingController();
  static final printedForm1 = TextEditingController();
  static final signatureForm1 = TextEditingController();

  /// form 2

  static final funeralPrintedForm2 = TextEditingController();
  static final funeralSignatureForm2 = TextEditingController();
  static final funeralDateTimeForm2 = TextEditingController();
  static final crematoryPrintedForm2 = TextEditingController();
  static final crematorySignatureForm2 = TextEditingController();
  static final crematoryDateTimeForm2 = TextEditingController();

  /// form 3

  static final printedReceiveForm3 = TextEditingController();
  static final relationshipReceiveForm3 = TextEditingController();
  static final signatureReceiveForm3 = TextEditingController();
  static final dateTimeReceiveForm3 = TextEditingController();
  static final printedReleasingForm3 = TextEditingController();
  static final signatureReleasingForm3 = TextEditingController();
  static final dateTimeReleasingForm3 = TextEditingController();
  static final uploadPhotoForm3 = TextEditingController();

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
