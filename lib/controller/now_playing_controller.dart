import 'dart:convert';

import 'package:get/get.dart';

import '../data/repository/now_playing_repo.dart';
import '../models/movies_model.dart';

class NowPlayingController extends GetxController {
  final NowPlayingRepo nowPlayingRepo;
  NowPlayingController({required this.nowPlayingRepo});


  List<Result> _nowPlayingList = [];
  List<Result> get nowPlayingList => _nowPlayingList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getNowPlayingList() async {
    final response = await nowPlayingRepo.getNowPlayingList();
    if (response.statusCode == 200) {
      _nowPlayingList = [];
      _nowPlayingList.addAll(
          MoviesModel.fromJson(
              json.decode(response.body)
          ).results as List<Result>
      );
      _isLoaded = true;
      update();
    } else {}
  }




}
