import 'package:flutter/material.dart';
import 'package:the_movie_db/controller/favorites_controller.dart';
import 'package:get/get.dart';
import '../../models/movies_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/favorite_widget.dart';

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
        return data.isLoaded?
        GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.favoritesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Dimensions.width10,
              mainAxisSpacing: Dimensions.height20,
              mainAxisExtent: Dimensions.height40*6
          ),
          itemBuilder: (context, position) {
            return _buildPageItem(position, data.favoritesList[position]);
          },
        ): const CircularProgressIndicator(
          color: AppColors.mainColor,
        );
      }),
    );
  }

  Widget _buildPageItem(int index, Result favorites) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouteHelper.getMovieDetail(favorites.id!, RouteHelper.favorites));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width10,
            ),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: index.isEven ? AppColors.secondaryColor : AppColors.tertiaryColor,
              image: favorites.posterPath != null?DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.image + favorites.posterPath!)
                ): const DecorationImage(
                    image: AssetImage("assets/images/no image.png")
                ),
            ),
          ),
          // Positioned(
          //   right: Dimensions.width20,
          //   top: Dimensions.height15,
          //   child: FavoriteWidget(
          //     movie: favorites,
          //   ),
          // ),
          FavoriteWidget(
            movie: favorites,
          ),

        ],
      ),
    );
  }
}
