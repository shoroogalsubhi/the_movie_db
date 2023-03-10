import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final bool small;

  const TitleTextWidget({
    Key? key,
    required this.text,
    this.color = AppColors.whiteColor,
    this.small = false,
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
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: small? Dimensions.font16: Dimensions.font20,
          fontWeight: small? FontWeight.w500 :FontWeight.w600,
            overflow: TextOverflow.fade
        ),
      ),
    );
  }
}
