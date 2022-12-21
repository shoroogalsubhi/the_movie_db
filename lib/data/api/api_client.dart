import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';
import 'package:http/http.dart' as http;
class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late SharedPreferences sharedPreferences;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.token)??"";
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token){
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<http.Response> getData(String uri, {Map<String, String>? headers}) async {
    http.Response response = await http.get(Uri.parse(uri), headers: headers ?? _mainHeaders);
    if (response.statusCode == 200) {
      return response;
    }else {
      throw Exception("Failed to get the data");
    }

  }

  Future<http.Response> postData(String uri, dynamic body) async{
    try{
      http.Response response = await http.post(Uri.parse(uri), body: body, headers: _mainHeaders);
      return response;
    }catch(e){
      print(e.toString());
      // return Response(statusCode: 1, statusText: e.toString());
      throw Exception("Failed to post the data");
    }
  }
}
