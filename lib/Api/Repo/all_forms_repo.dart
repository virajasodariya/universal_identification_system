import 'dart:developer';
import 'package:universal_identification_system/Api/ApiRoutes/api_routes.dart';
import 'package:universal_identification_system/Api/api_handlers.dart';
import 'package:universal_identification_system/Model/Response/all_forms_response_model.dart';

class AllFormsRepo extends BaseService {
  static Future allFormRepo() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: BaseService.allFormsUrl,
    );

    AllFormsResponseModel allFormsResponseModel =
        AllFormsResponseModel.fromJson(response);

    log('-----------------------$response');
    log('-----------------------${BaseService.allFormsUrl}');

    return allFormsResponseModel;
  }
}
