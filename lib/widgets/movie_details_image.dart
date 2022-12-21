import 'package:flutter/material.dart';
import 'package:the_movie_db/utils/dimensions.dart';

import '../utils/app_constants.dart';

class MovieDetailsImage extends StatelessWidget {
  final String? imagePath;

  const MovieDetailsImage({Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ImageClipper(),
      child: Container(
        height: Dimensions.height40*7,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          image: imagePath != null? DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.image + imagePath!)
                ): const DecorationImage(
                    image: AssetImage("assets/images/no image.png")
                ),
        ),
      ),
    );
  }
}


class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - Dimensions.height40*3);
    var controlsPoint = Offset(Dimensions.width40,size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controlsPoint.dx, controlsPoint.dy,
        endPoint.dx, endPoint.dy
    );
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;


}
