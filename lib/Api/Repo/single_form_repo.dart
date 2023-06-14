import 'dart:developer';
import 'package:universal_identification_system/Api/ApiRoutes/api_routes.dart';
import 'package:universal_identification_system/Api/api_handlers.dart';
import 'package:universal_identification_system/Model/Response/single_form_response_model.dart';

class SingleFormsRepo extends BaseService {
  static Future singleFormsRepo() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: BaseService.singleFormUrl,
    );

    SingleFormResponseModel singleFormResponseModel =
        SingleFormResponseModel.fromJson(response);

    log('-----------------------$response');
    log('-----------------------${BaseService.allFormsUrl}');

    return singleFormResponseModel;
  }
}
