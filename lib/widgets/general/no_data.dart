import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class NoData extends StatelessWidget {
  final String text;
  final bool bigImage;

  const NoData({Key? key,
    required this.text,
    this.bigImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/no data.png",
            width: bigImage? Dimensions.width40*8 :Dimensions.width40*4,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: Dimensions.font20,
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
