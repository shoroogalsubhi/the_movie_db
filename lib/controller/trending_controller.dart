import 'dart:convert';
import 'package:get/get.dart';
import '../data/repository/trending_repo.dart';
import '../models/movies_model.dart';

class TrendingController extends GetxController {
  final TrendingRepo trendingRepo;
  TrendingController({required this.trendingRepo});


  List<Result> _trendingList = [];
  List<Result> get trendingList => _trendingList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getTrendingList() async {
    final response = await trendingRepo.getTrendingList();
    if (response.statusCode == 200) {
      _trendingList = [];
      _trendingList.addAll(
          MoviesModel.fromJson(
              json.decode(response.body)
          ).results as List<Result>
      );
      _isLoaded = true;
      update();
    } else {}
  }




}
