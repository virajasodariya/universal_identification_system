import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:universal_identification_system/Api/Repo/states_repo.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:universal_identification_system/Model/Response/states_response_model.dart';

class StatesViewModel extends GetxController {
  final box = GetStorage();
  String? selectedStates;

  ApiResponse _apiResponseLogin =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponseLogin;

  Future<void> statesViewModel(Map<String, dynamic> body) async {
    _apiResponseLogin = ApiResponse.loading(message: 'Loading');
    update();
    try {
      StatesResponseModel response = await StatesRepo.statesRepo(
        box.read("countryId"),
        body: body,
      );

      _apiResponseLogin = ApiResponse.complete(response);

      log('statesResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponseLogin = ApiResponse.error(message: e.toString());

      log('statesViewModel-------->>>>>>$e');
    }
    update();
  }
}
