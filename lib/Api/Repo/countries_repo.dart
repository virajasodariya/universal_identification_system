import 'dart:developer';
import 'package:universal_identification_system/Api/ApiRoutes/api_routes.dart';
import 'package:universal_identification_system/Api/api_handlers.dart';
import 'package:universal_identification_system/Model/Response/countries_response_model.dart';

class CountriesRepo extends BaseService {
  static Future countriesRepo() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: BaseService.countriesUrl,
    );

    log('countriesRepo  ++++++++++++++++++++++++  RESPONSE   $response');
    log('countriesUrl ==> ${BaseService.countriesUrl}');

    CountriesResponseModel countriesResponseModel =
        CountriesResponseModel.fromJson(response);

    return countriesResponseModel;
  }
}
