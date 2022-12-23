import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../screens/movie_details/movie_details_image.dart';
import '../../utils/dimensions.dart';

class ShimmerMovieDetails extends StatelessWidget {
  const ShimmerMovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // movie Image
          const MovieDetailsImage(imagePath: null),
          Container(
              height: Dimensions.height100*5.7,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10,
              ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // movie title
                  oneLine(),
                  // movie genres
                  shimmerWidget(
                    Dimensions.height40,
                    Dimensions.width40*12,
                  ),
                  // movie reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(2, (_) =>
                        shimmerWidget(
                          Dimensions.height40,
                          Dimensions.width30*2,
                        ),
                    ),
                  ),
                  // movie overview
                  multipleLine(),
                  // cast info
                  shimmerWidget(
                    Dimensions.height15,
                    Dimensions.width30*2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(3, (_) =>
                        shimmerWidget(
                          Dimensions.height100*1.5,
                          Dimensions.width40*3,
                        ),
                    ),
                  ),
                ],
              )
          ),

        ],
      ),
    );
  }
  Widget oneLine(){
    return shimmerWidget(
      Dimensions.height15,
      Dimensions.width40*5,
    );
  }
  Widget multipleLine(){
    return SizedBox(
      height: Dimensions.height100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: List.generate(3, (_) =>
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height10/2
                  ),
                  child: shimmerWidget(
                    Dimensions.height15,
                    Dimensions.width40*10,
                  ),
                ),
            ),
          ),
          oneLine(),
        ],
      ),
    );
  }
  Widget shimmerWidget(double h, double w){
    return Container(
      height:h,
      width: w,
      color: Colors.grey[300],
    );
  }
}
