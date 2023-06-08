import 'dart:developer';

import 'package:universal_identification_system/Api/ApiRoutes/api_routes.dart';
import 'package:universal_identification_system/Api/api_handlers.dart';
import 'package:universal_identification_system/Model/Response/sign_up_response_model.dart';

class SignUpRepo extends BaseService {
  static Future signUpRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: BaseService.registerUrl, body: body);
    print('++++++++++++++++++++++++RESPONSE   $response');
    SignUpResponseModel signUpResponseModel =
        SignUpResponseModel.fromJson(response);

    log('-----------------------$response');
    log('-----------------------${BaseService.registerUrl}');
    return signUpResponseModel;
  }
}
