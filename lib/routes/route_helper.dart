import 'package:get/get.dart';
import 'package:the_movie_db/screens/trending/trending.dart';
import '../screens/favorite/favorites.dart';
import '../screens/home/home_page.dart';
import '../screens/movie_detail/movie_detail.dart';
import '../screens/movies_home/movies_home.dart';
import '../screens/splash_screen/splash_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String moviesHome = "/movies-home";
  static const String favorites = "/favorites";
  static const String trending = "/trending";
  static const String movieDetail = "/movie-detail";


  static String getSplashPage()=>splashPage;
  static String getInitial() => initial;
  static String getMoviesHome() => moviesHome;
  static String getFavorites()=> favorites;
  static String getTrending () => trending;
  static String getMovieDetail(int movieId, String page) => '$movieDetail?movieId=$movieId&page=$page';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () =>
    const SplashScreen()
    ),
    GetPage(name: initial, page: () {
      return const HomePage();
    }, transition: Transition.fade),

    GetPage(name: moviesHome, page: () {
      return const MoviesHome();
    }, transition: Transition.fade),

    GetPage(name: favorites, page: () {
      return const Favorites();
    }, transition: Transition.fade),

    GetPage(name: trending, page: () {
      return const Trending();
    }, transition: Transition.fade),

    GetPage(
      name: movieDetail,
      page: () {
        var movieId = Get.parameters['movieId'];
        var page = Get.parameters['page'];
        return MovieDetail(movieId: int.parse(movieId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),

  ];

}
