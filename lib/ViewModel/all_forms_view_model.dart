import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:universal_identification_system/Api/Repo/all_forms_repo.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:universal_identification_system/Model/Response/all_forms_response_model.dart';

class AllFormsViewModel extends GetxController {
  final box = GetStorage();

  ApiResponse _apiResponseAllForms =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponseAllForms;

  Future<void> allFormsViewModel() async {
    _apiResponseAllForms = ApiResponse.loading(message: 'Loading');

    update();
    try {
      AllFormsResponseModel response = await AllFormsRepo.allFormRepo(
        box.read("userId"),
      );

      _apiResponseAllForms = ApiResponse.complete(response);

      log('allFormsResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponseAllForms = ApiResponse.error(message: e.toString());

      log('allFormsViewModel-------->>>>>>$e');
    }
    update();
  }
}
