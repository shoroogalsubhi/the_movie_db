import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:the_movie_db/utils/app_constants.dart';
import '../data/repository/movies_repo.dart';
import '../models/categories_model.dart';
import '../models/movies_model.dart';
import 'favorites_controller.dart';

class MoviesController extends GetxController {
  final MoviesRepo moviesRepo;
  MoviesController({required this.moviesRepo});

  //lists
  List<Result> _nowPlayingList = [];
  List<Result> get nowPlayingList => _nowPlayingList;

  List<Result> _upcomingList = [];
  List<Result> get upcomingList => _upcomingList;

  List<Result> _categoryMoviesList = [];
  List<Result> get categoryMoviesList => _categoryMoviesList;

  List<CategoryModel> _categoryNamesList = [];
  List<CategoryModel> get categoryNamesList => _categoryNamesList;

  // selected Category |  -1 refer to all categories
  List<int> selectedCategory = [-1];
  final favoritesController = Get.find<FavoritesController>();



  //loading
  bool _isLoadedNowPlaying = false;
  bool get isLoadedNowPlaying => _isLoadedNowPlaying;

  bool _isLoadedUpcoming = false;
  bool get isLoadedUpcoming => _isLoadedUpcoming;

  bool _isLoadedCategory = false;
  bool get isLoadedCategory => _isLoadedCategory;


  Future<void> getMoviesList() async {
    await getCategoryList();
    await getNowPlayingList();
    await getUpcomingList();
    await getMoviesWithCategoryList();
  }


  Future<void> getNowPlayingList() async {
    final response = await moviesRepo.getMoviesList(AppConstants.nowPlying);
    _nowPlayingList = [];
    if (response.statusCode == 200) {
      _nowPlayingList.addAll(
          MoviesModel.fromJson(
              json.decode(response.body)
          ).results as List<Result>
      );
      _isLoadedNowPlaying = true;
      update();
    }
  }

  Future<void> getUpcomingList() async {
    final response = await moviesRepo.getMoviesList(AppConstants.upcoming);
    _upcomingList = [];
    if (response.statusCode == 200) {
      _upcomingList.addAll(
          MoviesModel.fromJson(
              json.decode(response.body)
          ).results as List<Result>
      );
      _isLoadedUpcoming = true;
      update();
    }
  }

  Future<void> getCategoryList() async {
    final response = await moviesRepo.getMoviesList(AppConstants.categories);
    _categoryNamesList = [];
    if (response.statusCode == 200) {
      _categoryNamesList.addAll(
          CategoriesModel.fromJson(
              json.decode(response.body)
          ).category as List<CategoryModel>
      );
      _isLoadedCategory = true;
      update();
    }
  }

  Future<void> getMoviesWithCategoryList() async {
    http.Response response;
    if(selectedCategory.first == -1){
      response = await moviesRepo.getMoviesList(AppConstants.moviesWithoutCategory);
    }else{
      String categories = ""; // list of categories
      for(int id in selectedCategory) {
        if (categories.isNotEmpty) {
          categories += ",";
        }
        categories += "${id}";
      }
      // get all movies of selected category
      response = await moviesRepo.getMoviesList(AppConstants.moviesWithCategory + categories);
    }

    _categoryMoviesList = [];
    if (response.statusCode == 200) {
      _categoryMoviesList.addAll(
          MoviesModel.fromJson(
              json.decode(response.body)
          ).results as List<Result>
      );
      _isLoadedUpcoming = true;
      update();
    }
  }


  bool isSelected(int id){
    for(int elementID in selectedCategory){
      if(elementID == id){
        return true;
      }
    }
    return false;
  }

  setSelectedCategory(int id){
    // All categories
    if(id == -1){
      selectedCategory = [];
      selectedCategory.add(_categoryNamesList.first.id!);
    }else{
      selectedCategory.remove(-1);
      if(isSelected(id)){
        selectedCategory.remove(id);
        // if there is no category selected then show All
        if(selectedCategory.isEmpty){
          selectedCategory.add(-1); //  -1 refer to all categories
        }
      }else{
        selectedCategory.add(id);
      }
    }
    update();
    getMoviesWithCategoryList();
    update();
  }

}
