import 'dart:developer';

import 'package:get/get.dart';
import 'package:universal_identification_system/Api/Repo/single_form_repo.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:universal_identification_system/Model/Response/single_form_response_model.dart';

class SingleFormViewModel extends GetxController {
  ApiResponse _apiResponseSingleForm =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponseSingleForm;

  Future<void> singleFormViewModel() async {
    _apiResponseSingleForm = ApiResponse.loading(message: 'Loading');

    update();
    try {
      SingleFormResponseModel response =
          await SingleFormsRepo.singleFormsRepo();

      _apiResponseSingleForm = ApiResponse.complete(response);

      log('getSingleFormResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponseSingleForm = ApiResponse.error(message: e.toString());

      log('getSingleFormViewModel-------->>>>>>$e');
    }
    update();
  }
}
