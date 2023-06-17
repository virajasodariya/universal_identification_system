import 'dart:developer';
import 'package:universal_identification_system/Api/ApiRoutes/api_routes.dart';
import 'package:universal_identification_system/Api/api_handlers.dart';
import 'package:universal_identification_system/Model/Response/login_response_model.dart';

class LoginRepo extends BaseService {
  static Future loginRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: BaseService.loginUrl,
      body: body,
    );

    log('loginRepo  ++++++++++++++++++++++++  RESPONSE   $response');
    log('loginUrl ==> ${BaseService.loginUrl}');

    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(response);

    return loginResponseModel;
  }
}
