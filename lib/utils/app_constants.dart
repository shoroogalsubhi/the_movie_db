class AppConstants{

  //------------------ Your Data ------------------
  static const String _apiKey = "?api_key=<<Your_api_key>>";
  static const String _accountID = "<<Your_account_ID>>";
  static const String _sessionID = "&session_id=<<Your_session_ID>>";
  //------------------ End Your Data ------------------

  static const String appName = "The Movie DB app";
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String _language = "&language=en-US";
  static const String image = "https://image.tmdb.org/t/p/w500";
  static const String token = "";

  static const String favorites = "/account/$_accountID/favorite/movies$_apiKey$_sessionID";
  static const String postFavorites = "/account/$_accountID/favorite$_apiKey$_sessionID";

  static const String trending = "/trending/movie/day$_apiKey";
  static const String nowPlying = "/movie/now_playing$_apiKey$_language&page=1";
  static const String upcoming = "/movie/upcoming$_apiKey$_language&page=1";

  static const String categories = "/genre/movie/list$_apiKey$_language";
  static const String moviesWithCategory = "$getMovies&with_genres=";
  static const String moviesWithoutCategory = "$getMovies&without_genres";
  static const String getMovies = "/discover/movie$_apiKey&include_video=false&page=1";

  static const String movieDetails = "$_apiKey$_language";
  static const String cast = "/credits$_apiKey$_language";

}