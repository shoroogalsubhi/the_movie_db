import 'package:flutter/material.dart';
import 'package:the_movie_db/controller/favorites_controller.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/general/no_data.dart';
import '../../widgets/images/build_image_item.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    Get.find<FavoritesController>().getFavoritesList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        elevation: 0,
      ),
      body: GetBuilder<FavoritesController>(builder: (data) {
        if(data.isLoaded){
          return data.favoritesList.isNotEmpty? GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.favoritesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Dimensions.width10,
                mainAxisSpacing: Dimensions.height20,
                mainAxisExtent: Dimensions.height40*6,
            ),
            itemBuilder: (context, position) {
              return BuildImageItem(
                index:position,
                movie: data.favoritesList[position],
                routerName: RouteHelper.favorites,
              );
            },
          ): const NoData(text: "There are no favorites movies", bigImage: true,);
        }else{
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.whiteColor,
            ),
          );
        }
      }),
    );
  }
}
