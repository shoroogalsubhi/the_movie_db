import 'package:flutter/material.dart';
import 'package:the_movie_db/utils/dimensions.dart';

import '../utils/colors.dart';

class ReviewsWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const ReviewsWidget({Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.width20),
      child: Column(
        children: [
          Icon(icon, color: AppColors.mainColor2,),
          Text(text),
        ],
      ),
    );
  }
}
