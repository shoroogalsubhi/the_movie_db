import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';
import 'package:http/http.dart' as http;

class NowPlayingRepo extends GetxService {
  final ApiClient apiClient;
  NowPlayingRepo ({required this.apiClient});

  Future <http.Response> getNowPlayingList() async{
    return await apiClient.getData(AppConstants.baseUrl + AppConstants.nowPlying);
  }
}