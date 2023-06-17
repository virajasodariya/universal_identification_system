import 'dart:developer';
import 'package:universal_identification_system/Api/ApiRoutes/api_routes.dart';
import 'package:universal_identification_system/Api/api_handlers.dart';
import 'package:universal_identification_system/Model/Response/all_forms_response_model.dart';

class AllFormsRepo extends BaseService {
  static Future allFormRepo(String userId) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: '${BaseService.allFormsUrl}/$userId',
    );

    log('allFormRepo  ++++++++++++++++++++++++  RESPONSE   $response');
    log('allFormsUrl ==> ${BaseService.allFormsUrl}/$userId');

    AllFormsResponseModel allFormsResponseModel =
        AllFormsResponseModel.fromJson(response);

    return allFormsResponseModel;
  }
}
