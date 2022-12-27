import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function()? onTap;
  const AppIcon({Key? key,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // I used InkWell instead of the IconButton to center
    // the icon in the Container
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Dimensions.width30,
        width: Dimensions.width30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: Colors.white60,
        ),
        child: Icon(
          icon,
          color: color,
          size: Dimensions.width20,
        ),
      ),
    );
  }
}
