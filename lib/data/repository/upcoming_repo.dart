import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';
import 'package:http/http.dart' as http;

class UpcomingRepo extends GetxService {
  final ApiClient apiClient;
  UpcomingRepo ({required this.apiClient});

  Future <http.Response> getUpcomingList() async{
    return await apiClient.getData(AppConstants.baseUrl + AppConstants.upcoming);
  }
}