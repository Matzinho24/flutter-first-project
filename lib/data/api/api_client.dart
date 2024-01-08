import 'package:connect/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {

  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.appBaseUrl
  }){
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    token = token.replaceAll(RegExp('"'), '');
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'JWT $token',
     };
  }

  Future<Response> getData(String uri) async {
    try {
      print(baseUrl);
      print(uri);
      print(_mainHeaders);
      Response response = await get(uri);
      return response;
    } catch(e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}