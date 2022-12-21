import 'package:flutter/material.dart';
import '../../models/cast_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class BuildCast extends StatelessWidget {
  final int index;
  final Cast movieCast;

  const BuildCast({Key? key,
    required this.index,
    required this.movieCast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Radius radius = Radius.circular(Dimensions.radius15);
    return Container(
      width: Dimensions.width40*3,
      margin: EdgeInsets.all(Dimensions.width10),
      child: Column(
        children: [
          Container(
            height: Dimensions.height40*4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: radius,
                topLeft: radius,
              ),
              color: index.isEven ? AppColors.secondaryColor : AppColors.tertiaryColor,
              image: movieCast.profilePath != null?DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.image + movieCast.profilePath!)
              ): const DecorationImage(
                  image: AssetImage("assets/images/no image.png")
              ),
            ),
          ),
          Container(
            height: Dimensions.height40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: radius,
                bottomLeft: radius,
              ),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 2),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(2, 0),
                ),
              ],
            ),
            child: Center(
                child:Text(
                  movieCast.name??"Unknown",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: Dimensions.font16,
                    fontWeight: FontWeight.w500,
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
