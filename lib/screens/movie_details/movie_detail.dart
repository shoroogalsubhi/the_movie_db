import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/screens/movie_details/build_reviews.dart';
import 'package:the_movie_db/widgets/movie_details_widgets/shimmer_movie_details.dart';
import '../../controller/movie_details_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/general/favorite_widget.dart';
import 'movie_details_image.dart';
import '../../widgets/general/title_text_widget.dart';
import 'build_cast.dart';
import 'build_genres.dart';


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
          return data.isLoaded ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // movie image and (back and like) icons
              SizedBox(
                height: Dimensions.height40 * 7,
                child: Stack(
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
                            icon: const Icon(
                              Icons.arrow_back, color: Colors.white,),
                            onPressed: () {
                              data.clearData();
                              Get.back();
                            },
                          ),
                          FavoriteWidget(
                            movieId: widget.movieId,
                            movie: data.movieInfo,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // movie title
              TitleTextWidget(text: data.movieInfo.title ?? "There is no title"),
              // movie genres
              BuildGenres(data: data),
              // movie reviews
              BuildReviews(data: data),
              // movie overview
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20
                ),
                child: Text(data.movieInfo.overview ?? "There is no overview"),
              ),
              // cast info
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: Dimensions.height40 * 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleTextWidget(text: "Cast"),
                      SizedBox(
                        height: Dimensions.height40 * 6,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.movieCastList.length,
                            itemBuilder: (context, position) {
                              return BuildCast(index: position,
                                  movieCast: data.movieCastList[position]);
                            }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ):
          const ShimmerMovieDetails();

        }),
      ),
    );
  }

}
