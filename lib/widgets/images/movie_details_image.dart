import 'package:flutter/material.dart';
import 'package:the_movie_db/utils/dimensions.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';

class MovieDetailsImage extends StatelessWidget {
  final String? imagePath;

  const MovieDetailsImage({Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height40*7,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.width10/11,
          vertical: Dimensions.height10/11
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(Dimensions.radius30*5)
        ),
        image: imagePath != null? DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(AppConstants.image + imagePath!)
        ): const DecorationImage(
            image: AssetImage("assets/images/no image.png")
        ),
      ),
    );
  }
}
