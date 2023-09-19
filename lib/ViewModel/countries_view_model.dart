import 'dart:developer';
import 'package:get/get.dart';
import 'package:universal_identification_system/Api/Repo/countries_repo.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:universal_identification_system/Model/Response/countries_response_model.dart';

class CountriesViewModel extends GetxController {
  String? selected = "selected country";

  ApiResponse _apiResponseCountries =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponseCountries;

  Future<void> countriesViewModel() async {
    _apiResponseCountries = ApiResponse.loading(message: 'Loading');
    update();
    try {
      CountriesResponseModel response = await CountriesRepo.countriesRepo();

      _apiResponseCountries = ApiResponse.complete(response);

      log('countriesResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponseCountries = ApiResponse.error(message: e.toString());

      log('countriesViewModel-------->>>>>>$e');
    }
    update();
  }
}
