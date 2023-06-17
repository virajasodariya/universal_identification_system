import 'dart:developer';
import 'package:universal_identification_system/Api/ApiRoutes/api_routes.dart';
import 'package:universal_identification_system/Api/api_handlers.dart';
import 'package:universal_identification_system/Model/Response/single_form_response_model.dart';

class SingleFormsRepo extends BaseService {
  static Future singleFormsRepo(String userId, String formID) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: '${BaseService.singleFormUrl}/$userId/$formID',
    );

    log('singleFormsRepo  ++++++++++++++++++++++++  RESPONSE   $response');
    log('singleFormUrl ==> ${BaseService.singleFormUrl}/$userId/$formID');

    SingleFormResponseModel singleFormResponseModel =
        SingleFormResponseModel.fromJson(response);

    return singleFormResponseModel;
  }
}
