import 'package:flutter/material.dart';
import '../../controller/movie_details_controller.dart';
import '../../utils/dimensions.dart';

class BuildGenres extends StatelessWidget {
  final MovieDetailsController data;

  const BuildGenres({Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.movieInfo.genres?.length,
          itemBuilder: (context, position) {
            return data.movieInfo.genres?[position]['name'] != null?Container(
              padding: EdgeInsets.all(Dimensions.width10),
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white70
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius15)
              ),
              child: Text(data.movieInfo.genres?[position]['name']),
            ):Container();
          }),
    );
  }
}
