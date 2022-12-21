import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/screens/movie_detail/reviews.dart';
import '../../controller/movie_details_controller.dart';
import '../../models/cast_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/favorite_widget.dart';
import 'movie_details_image.dart';
import '../../widgets/reviews_widget.dart';
import '../../widgets/title_text_widget.dart';
import 'build_cast.dart';
import 'genres.dart';

class MovieDetail extends StatefulWidget {
  final int movieId;
  final String page;

  const MovieDetail({
    Key? key,
    required this.movieId,
    required this.page
  }) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Radius radius = Radius.circular(Dimensions.radius15);

  @override
  Widget build(BuildContext context) {
    Get.find<MovieDetailsController>().getInfo(widget.movieId);
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<MovieDetailsController>(builder: (data) {
          return Stack(
            children: [
              // movie Image
              MovieDetailsImage(
                imagePath: data.movieInfo.backdropPath,
              ),
              // icons: back and like
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height40,
                    horizontal: Dimensions.width10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,color: Colors.white,),
                      onPressed: (){
                        print("widget.page ${widget.page }");
                        if(widget.page == "/movies-home"){
                          Get.offNamed(RouteHelper.getInitial());
                        }else if(widget.page == "/favorites"){
                          Get.offNamed(RouteHelper.getFavorites());
                        }else{
                          // Get.toNamed(RouteHelper.trending);
                          Get.back();
                        }
                        // Get.back();

                      },
                    ),
                    FavoriteWidget(
                      movie: data.movieInfo,
                    ),
                  ],
                ),
              ),
              // movie info (title, genres, reviews, overview, and cast)
              Padding(
                padding: EdgeInsets.only(top: Dimensions.height40*7,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // movie title
                    TitleTextWidget(text: data.movieInfo.title??"There is no title"),
                    // movie genres
                    BuildGenres(data: data),
                    // movie reviews
                    BuildReviews(data: data),
                    // movie overview
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20
                        ),
                      child: Text(data.movieInfo.overview??"There is no overview"),
                    ),
                    // cast info
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: Dimensions.height40*8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleTextWidget(text: "Cast"),
                            data.isLoaded? SizedBox(
                              height: Dimensions.height40*6,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data.movieCastList.length,
                                  itemBuilder: (context, position) {
                                    return BuildCast(index: position, movieCast: data.movieCastList[position]);
                                  }),
                            ): const CircularProgressIndicator(
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
