import 'dart:convert';
import 'package:get/get.dart';
import '../data/repository/favorites_repo.dart';
import '../models/movies_model.dart';

class FavoritesController extends GetxController {
  final FavoritesRepo favoritesRepo;
  FavoritesController({required this.favoritesRepo});

  List<Result> _favoritesList = [];
  List<Result> get favoritesList => _favoritesList;

  // data loaded or there is no data
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getFavoritesList() async {
    final response = await favoritesRepo.getFavoritesList();
    if (response.statusCode == 200) {
      _favoritesList = [];
      _favoritesList.addAll(
          MoviesModel.fromJson(
              json.decode(response.body)
          ).results as List<Result>
      );
    }
    _isLoaded = true;
    update();
  }

  Future<void> toggle(int movieId, bool isFavorite) async {
    final response = await favoritesRepo.postMovieToFavorites(movieId,isFavorite);
    //response.statusCode:
    // 1: (mark as favorite) | 13: (mark as not favorite)
    if(response.statusCode == 200 || response.statusCode == 201){
      // Get.find<MoviesController>().setIsFavorite(movieId,isFavorite);
      // delete the movie from the list if it is marked as not favorite
      if(!isFavorite){
        _favoritesList.removeWhere((item) => item.id == movieId);
      }
      update();
    }else{
      throw Exception(response.body);
    }

  }

  bool isInFavoriteList(int movieId){
    final inFavoriteList = _favoritesList.indexWhere((item) => item.id == movieId);
    // case -1: the movie is not on the favorites list
    if(inFavoriteList == -1) {
      return false;
    }
    // the movie is on the favorites list
    return true;
  }

}
