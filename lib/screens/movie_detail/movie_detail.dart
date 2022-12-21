import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/movie_details_controller.dart';
import '../../models/cast_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/favorite_widget.dart';
import '../../widgets/movie_details_image.dart';
import '../../widgets/reviews_widget.dart';
import '../../widgets/title_text_widget.dart';

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
    // print("pageId: ${widget.movieId} | page: ${widget.page}");
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
                    _buildGenres(data),
                    // movie reviews
                    _buildReviews(data),
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
                                    return _buildCast(position, data.movieCastList[position]);
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

  // movie genres
  Widget _buildGenres(MovieDetailsController data){
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
                  color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius15)
              ),
              child: Text(data.movieInfo.genres?[position]['name']),
            ):Container();
          }),
    );
  }
  // movie reviews
  Widget _buildReviews(MovieDetailsController data){
    return Column(
      children: [
        Divider(color: Colors.grey,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ReviewsWidget(
              icon: Icons.star,
              text: "${data.movieInfo.voteAverage}/10",
            ),
            ReviewsWidget(
              icon: Icons.reviews,
              text: "${data.movieInfo.voteCount} Reviews",
            ),
          ],
        ),
        // Divider(color: Colors.amber,),
      ],
    );
  }
  // movie cast
  Widget _buildCast(int index, Cast movieCast) {
    return Container(
      width: Dimensions.width40*3,
      margin: EdgeInsets.all(Dimensions.width10),
      child: Column(
        children: [
          Container(
            height: Dimensions.height40*4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: radius,
                topLeft: radius,
              ),
              color: index.isEven ? AppColors.secondaryColor : AppColors.tertiaryColor,
              image: movieCast.profilePath != null?DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.image + movieCast.profilePath!)
              ): const DecorationImage(
                  image: AssetImage("assets/images/no image.png")
              ),
            ),
          ),
          Container(
            height: Dimensions.height40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: radius,
                  bottomLeft: radius,
              ),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 2),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(2, 0),
                ),
              ],
            ),
            child: Center(
                child:Text(
                  movieCast.name??"Unknown",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: Dimensions.font16,
                    fontWeight: FontWeight.w500,
                  ),

                )
            ),
          ),
        ],
      ),
    );
  }
}
