import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/favorites_controller.dart';
import '../controller/movie_details_controller.dart';
import '../controller/movies_controller.dart';
import '../controller/trending_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/favorites_repo.dart';
import '../data/repository/movie_details_repo.dart';
import '../data/repository/movies_repo.dart';
import '../data/repository/trending_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  //merge with getX
  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));

  //repositories
  Get.lazyPut(() => TrendingRepo(apiClient: Get.find()));
  Get.lazyPut(() => MoviesRepo(apiClient: Get.find()));
  Get.lazyPut(() => MovieDetailsRepo(apiClient: Get.find()));
  Get.lazyPut(() => FavoritesRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => TrendingController(trendingRepo: Get.find()));
  Get.lazyPut(() => MoviesController(moviesRepo: Get.find()));
  Get.lazyPut(() => MovieDetailsController(movieDetailsRepo: Get.find()));
  Get.lazyPut(() => FavoritesController(favoritesRepo: Get.find()));
}
