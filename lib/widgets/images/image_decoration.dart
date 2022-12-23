import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class ImageDecoration extends StatelessWidget {
  final String? imagePath;
  final int index;
  final double height;
  final double width;

  const ImageDecoration({Key? key,
    required this.imagePath,
    required this.index,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,
      width: width,
      margin: EdgeInsets.all(Dimensions.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: index.isEven ? AppColors.secondaryColor : AppColors.tertiaryColor,
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
