import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/controller/movies_controller.dart';
import '../../models/movies_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/favorite_widget.dart';
import '../../widgets/title_text_widget.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleTextWidget(text: "Movies"),
        GetBuilder<MoviesController>(builder: (data) {
          return data.isLoadedCategory? SizedBox(
            height: Dimensions.height30*2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.categoryNamesList.length,
                itemBuilder: (context, position) {
                  return _buildCategories(position, data);
                }
            ),
          ): const CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        GetBuilder<MoviesController>(builder: (data) {
          return data.isLoadedUpcoming? SizedBox(
            height: Dimensions.pageViewContainer*1.5,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.categoryMoviesList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, data.categoryMoviesList[position]);
                }
            ),
          ): const CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, Result movie) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouteHelper.getMovieDetail(movie.id!, RouteHelper.moviesHome));
      },
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            width: Dimensions.width40*3,
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width10,
                vertical: Dimensions.height10
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: index.isEven ? AppColors.secondaryColor : AppColors.tertiaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstants.image + movie.posterPath!),
              ),
            ),
          ),
          // Positioned(
          //   right: Dimensions.width20,
          //   top: Dimensions.height15,
          //   child: FavoriteWidget(
          //     movie: movie,
          //   ),
          // ),
          FavoriteWidget(
            movie: movie,
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(int index, MoviesController data) {
    var category = data.categoryNamesList[index].name!;
    bool selected = Get.find<MoviesController>().isSelected(data.categoryNamesList[index].id!);
    return Container(
      margin: EdgeInsets.all(Dimensions.width10),
      decoration: BoxDecoration(
        color: selected? Colors.amber: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius20)
      ),
      child: TextButton(
        child: Text(
          category,
          style: TextStyle(
            color: selected? Colors.white: AppColors.mainColor,
            fontSize: Dimensions.font16
          ),
        ),
        onPressed: (){
          Get.find<MoviesController>().setSelectedCategory(data.categoryNamesList[index].id!);
        },
      ),
    );

  }
}
