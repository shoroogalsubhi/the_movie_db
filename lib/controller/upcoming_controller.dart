import 'dart:convert';
import 'package:get/get.dart';
import '../data/repository/upcoming_repo.dart';
import '../models/movies_model.dart';

class UpcomingController extends GetxController {
  final UpcomingRepo upcomingRepo;
  UpcomingController({required this.upcomingRepo});


  List<Result> _upcomingList = [];
  List<Result> get upcomingList => _upcomingList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;


  Future<void> getUpcomingList() async {
    final response = await upcomingRepo.getUpcomingList();
    if (response.statusCode == 200) {
      _upcomingList = [];
      _upcomingList.addAll(
          MoviesModel.fromJson(
              json.decode(response.body)
          ).results as List<Result>
      );
      _isLoaded = true;
      update();
    } else {}
  }




}
