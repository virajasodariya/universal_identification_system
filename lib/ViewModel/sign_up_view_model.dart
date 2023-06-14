import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Api/Repo/sign_up_repo.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:universal_identification_system/Model/Response/sign_up_response_model.dart';

class SignUpViewModel extends GetxController {
  ApiResponse _apiResponseSignUp =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponseSignUp;

  TextEditingController nameSignUp = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
  TextEditingController confirmPasswordSignUp = TextEditingController();

  Future<void> signUpViewModel(Map<String, dynamic> body) async {
    _apiResponseSignUp = ApiResponse.loading(message: 'Loading');
    update();
    try {
      SignUpResponseModel response = await SignUpRepo.signUpRepo(body: body);

      _apiResponseSignUp = ApiResponse.complete(response);

      log('signUpViewModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponseSignUp = ApiResponse.error(message: e.toString());

      log('signUpViewModel-------->>>>>>$e');
    }
    update();
  }
}
