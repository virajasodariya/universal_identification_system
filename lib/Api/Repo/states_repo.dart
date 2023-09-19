import 'dart:developer';
import 'package:universal_identification_system/Api/ApiRoutes/api_routes.dart';
import 'package:universal_identification_system/Api/api_handlers.dart';
import 'package:universal_identification_system/Model/Response/states_response_model.dart';

class StatesRepo extends BaseService {
  static Future statesRepo(String countryId,
      {required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: "${BaseService.statesUrl}/$countryId",
      body: body,
    );

    log('statesRepo  ++++++++++++++++++++++++  RESPONSE   $response');
    log('statesUrl ==> ${BaseService.statesUrl}/$countryId');

    StatesResponseModel statesResponseModel =
        StatesResponseModel.fromJson(response);

    return statesResponseModel;
  }
}
