import 'package:flutter/material.dart';
import '../../models/movies_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/favorite_widget.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';

class BuildPageItem extends StatelessWidget {
  final int index;
  final Result movie;

  const BuildPageItem({Key? key,
    required this.index,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouteHelper.getMovieDetail(movie.id!, RouteHelper.moviesHome));
      },
      child: Stack(
        children: [
          Container(
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
          Positioned(
            right: Dimensions.width20,
            top: Dimensions.height15,
            child: FavoriteWidget(
              movieId: movie.id!,
              movie: movie,
            ),
          ),
        ],
      ),
    );
  }
}
