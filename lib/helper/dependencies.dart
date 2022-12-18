import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movie_db/data/repository/now_playing_repo.dart';

import '../controller/now_playing_controller.dart';
import '../controller/trending_controller.dart';
import '../controller/upcoming_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/trending_repo.dart';
import '../data/repository/upcoming_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  //merge with getX
  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));

  //repo
  Get.lazyPut(() => NowPlayingRepo(apiClient: Get.find()));
  Get.lazyPut(() => UpcomingRepo(apiClient: Get.find()));
  Get.lazyPut(() => TrendingRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => NowPlayingController(nowPlayingRepo: Get.find()));
  Get.lazyPut(() => UpcomingController(upcomingRepo: Get.find()));
  Get.lazyPut(() => TrendingController(trendingRepo: Get.find()));
}
