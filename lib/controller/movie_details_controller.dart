import 'dart:convert';
import 'package:get/get.dart';
import '../data/repository/movie_details_repo.dart';
import '../models/cast_model.dart';
import '../models/movies_model.dart';
import '../utils/app_constants.dart';

class MovieDetailsController extends GetxController {
  final MovieDetailsRepo movieDetailsRepo;
  MovieDetailsController({required this.movieDetailsRepo});


  Result _movieInfo = Result();
  Result get movieInfo => _movieInfo;

  List<Cast> _movieCastList = [];
  List<Cast> get movieCastList => _movieCastList;


  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  getInfo(int movieId)async{
    _isLoaded =false;
    await getMovieInfo(movieId);
    await getMovieCastList(movieId);
  }

  getMovieInfo(int movieId) async {
    final response = await movieDetailsRepo.getMovieInfo(movieId);
    if (response.statusCode == 200) {
      _movieInfo = Result.fromJson(
          json.decode(response.body)
      );
      // _isLoaded = true;
      // update();
    }
  }

  Future<void> getMovieCastList(int movieId) async {
    final response = await movieDetailsRepo.getCast(movieId);
    if (response.statusCode == 200) {
      _movieCastList = [];
      _movieCastList.addAll(
          CastModel.fromJson(
              json.decode(response.body)
          ).cast as List<Cast>
      );
      _isLoaded = true;
      update();
    } else {}
  }

  void clearData(){
    _movieInfo = Result();
    _movieCastList = [];
    _isLoaded = false;
    print("data clear");
  }

}
