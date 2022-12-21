import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';
import 'package:http/http.dart' as http;

class FavoritesRepo extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  FavoritesRepo ({required this.apiClient, required this.sharedPreferences});

  Future <http.Response> getFavoritesList() async{
    return await apiClient.getData(AppConstants.baseUrl + AppConstants.favorites);
  }

  Future<http.Response> postMovieToFavorites(int movieId, bool isFavorite) async{
    return await apiClient.postData(
    AppConstants.baseUrl + AppConstants.postFavorites,
        json.encode({"media_type": "movie", "media_id": movieId, "favorite": isFavorite})
    );
  }
}