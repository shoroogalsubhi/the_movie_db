import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';
import 'package:http/http.dart' as http;

class MoviesRepo extends GetxService {
  final ApiClient apiClient;
  MoviesRepo ({required this.apiClient});

  Future <http.Response> getMoviesList(String title) async{
    return await apiClient.getData(AppConstants.baseUrl + title);
  }
}