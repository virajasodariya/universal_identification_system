import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'api_execption.dart';

enum APIType { aGet, aPost, aImageForm, aPut, aPatch, aDelete }

class ApiService {
  var response;
  Future<dynamic> getResponse({
    required APIType apiType,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      if (apiType == APIType.aGet) {
        final result = await http.get(
          Uri.parse(url),
        );
        response = returnResponse(result.statusCode, result.body);
        log("REQUEST PARAMETER url  $url");

        log("resp${result.body}");
      } else if (apiType == APIType.aPost) {
        final result =
            await http.post(Uri.parse(url), body: body, headers: header);

        log("resp${result.body}");

        response = returnResponse(result.statusCode, result.body);
        log('result.statusCode-------->>>>>>${result.statusCode}');
      }
    } catch (error) {
      return log('ERROR====>[$error]');
    }
    return response;
  }

  returnResponse(int status, String result) {
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 201:
        return jsonDecode(result);
      case 400:
        return jsonDecode(result);

      case 404:
        throw ServerException('Server Error');
      case 500:
      default:
      // throw FetchDataException('Internal Server Error');
    }
  }
}
