import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:the_movie_db/controller/now_playing_controller.dart';
import 'package:the_movie_db/controller/trending_controller.dart';
import 'package:the_movie_db/controller/upcoming_controller.dart';
import 'package:the_movie_db/utils/colors.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;

  Future<void> _loadResources() async {
    await Get.find<NowPlayingController>().getNowPlayingList();
    await Get.find<UpcomingController>().getUpcomingList();
    await Get.find<TrendingController>().getTrendingList();

  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    animController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    )..forward();
    animation = CurvedAnimation(
        parent: animController,
        curve: Curves.linear
    );

    Timer(
        const Duration(seconds:3, ), ()=>
        Get.offNamed(RouteHelper.getInitial())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: ScaleTransition(
        scale: animation,
        child: Center(
          child: SvgPicture.asset("assets/images/tmdb.svg", width: Dimensions.splashImg),
        ),
      ),
    );
  }
}



