import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/widgets/general/title_text_widget.dart';
import '../../controller/trending_controller.dart';
import '../../models/movies_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/general/favorite_widget.dart';
import '../../widgets/general/no_data.dart';
import '../../widgets/images/image_decoration.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    Get.find<TrendingController>().getTrendingList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending"),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<TrendingController>(builder: (data) {
        if(data.isLoaded){
          return data.trendingList.isNotEmpty?Container(
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.width10,
            ),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.trendingList.length,
                itemBuilder: (context, position) {
                  return _buildMovieItem(position, data.trendingList[position]);
                }),
          ): const NoData(text: "There are no trending movies", bigImage: true,);
        }else{
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.whiteColor,
            ),
          );
        }
      }),
    );
  }

  // movie info (name and ration)
  Widget _buildMovieItem(int index, Result trending) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouteHelper.getMovieDetail(trending.id!, RouteHelper.trending));
      },
      child: Stack(
        children: [
          ImageDecoration(
              imagePath: trending.backdropPath,
              index: index,
              height: Dimensions.height100*2,
              width:Dimensions.width100*4,
          ),
          Positioned(
            right: Dimensions.width40,
            top: Dimensions.width30,
            child: FavoriteWidget(movie: trending),
          ),
          // movie info
          _movieInfo(trending),
        ],
      ),
    );
  }

  // movie info (name and ration)
  Widget _movieInfo(Result trending){
    double vote = double.parse(trending.voteAverage??"0");
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Dimensions.width100*3,
        height: Dimensions.height30*3,
        margin: EdgeInsets.only(
            top:Dimensions.height100*1.6
        ),
        decoration: BoxDecoration(
            // color: Colors.white70,
            color: AppColors.mainColor2.withOpacity(0.8),

            borderRadius: BorderRadius.circular(Dimensions.radius15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //movie name
            TitleTextWidget(
              text: trending.title??"Unnamed",
              color: AppColors.whiteColor,
              small: true,
            ),
            //rating
            RatingBar.builder(
              initialRating: vote/ 2,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              onRatingUpdate: (_){},
              itemCount: 5,
              itemSize: Dimensions.width20,
              unratedColor: AppColors.whiteColor,
              itemPadding: EdgeInsets.symmetric(horizontal: Dimensions.width10/3),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
