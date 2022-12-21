import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:the_movie_db/controller/movie_details_controller.dart';
import 'package:the_movie_db/controller/movies_controller.dart';
import 'package:the_movie_db/controller/trending_controller.dart';
import 'package:the_movie_db/routes/route_helper.dart';
import 'package:the_movie_db/utils/colors.dart';
import 'package:the_movie_db/utils/dimensions.dart';
import 'controller/favorites_controller.dart';
import 'helper/dependencies.dart' as dep;


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(builder: (_) {
      return GetBuilder<TrendingController>(builder: (_) {
        return GetBuilder<MovieDetailsController>(builder: (_) {
          return GetBuilder<FavoritesController>(builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'The Movie DB App',
              theme: ThemeData(
                  scaffoldBackgroundColor: AppColors.mainColor,
                  textTheme: TextTheme(
                    bodyMedium: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.font16
                    ),
                  )
              ),
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes,
            );
          });
        });
      });
    });
  }
}
