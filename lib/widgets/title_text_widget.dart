import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;

  const TitleTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20,
          vertical:  Dimensions.height10
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: Dimensions.font20,
        ),
      ),
    );
  }
}
