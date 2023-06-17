import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:universal_identification_system/Api/Repo/login_repo.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:get/get.dart';
import 'package:universal_identification_system/Model/Response/login_response_model.dart';

class LoginViewModel extends GetxController {
  final box = GetStorage();

  ApiResponse _apiResponseLogin =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponseLogin;

  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  Future<void> loginViewModel(Map<String, dynamic> body) async {
    _apiResponseLogin = ApiResponse.loading(message: 'Loading');
    update();
    try {
      LoginResponseModel response = await LoginRepo.loginRepo(body: body);

      _apiResponseLogin = ApiResponse.complete(response);
      box.write("userId", response.data!.userId.toString());

      log('loginResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponseLogin = ApiResponse.error(message: e.toString());

      log('loginViewModel-------->>>>>>$e');
    }
    update();
  }
}
