import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';
import 'package:http/http.dart' as http;

class TrendingRepo extends GetxService {
  final ApiClient apiClient;
  TrendingRepo ({required this.apiClient});

  Future <http.Response> getTrendingList() async{
    return await apiClient.getData(AppConstants.baseUrl + AppConstants.trending);
  }
}