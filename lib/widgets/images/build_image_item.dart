import 'package:flutter/material.dart';
import '../../models/movies_model.dart';
import '../../utils/dimensions.dart';
import '../general/favorite_widget.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';
import 'image_decoration.dart';

class BuildImageItem extends StatelessWidget {
  final int index;
  final Result movie;
  final String routerName;

  const BuildImageItem({Key? key,
    required this.index,
    required this.movie,
    required this.routerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouteHelper.getMovieDetail(movie.id!, routerName));
      },
      child: Stack(
        children: [
          ImageDecoration(
              imagePath: movie.posterPath,
              index: index,
              height: routerName == "/favorites"?Dimensions.height100*3:Dimensions.height100*2,
              width: routerName == "/favorites"? Dimensions.width100*2:Dimensions.width40*3,
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
