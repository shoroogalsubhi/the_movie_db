import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';
import 'package:http/http.dart' as http;

class MovieDetailsRepo extends GetxService {
  final ApiClient apiClient;
  MovieDetailsRepo ({required this.apiClient});

  Future <http.Response> getMovieInfo(int movieId) async{
    return await apiClient.getData("${AppConstants.baseUrl}/movie/$movieId${AppConstants.movieDetails}");
  }
  Future <http.Response> getCast(int movieId) async{
    return await apiClient.getData("${AppConstants.baseUrl}/movie/$movieId${AppConstants.cast}");
  }
}