import 'package:flutter/material.dart';
import '../../controller/movies_controller.dart';
import '../../models/movies_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/favorite_widget.dart';
import '../../widgets/title_text_widget.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleTextWidget(text: "Upcoming"),
        GetBuilder<MoviesController>(builder: (data) {
          return data.isLoadedUpcoming? SizedBox(
            height: Dimensions.pageViewContainer,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.upcomingList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, data.upcomingList[position]);
                }),
          ): const CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, Result upcoming) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouteHelper.getMovieDetail(upcoming.id!, RouteHelper.moviesHome));
      },
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            width: Dimensions.width40*3,
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.width10,
                vertical: Dimensions.height10
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: index.isEven ? AppColors.secondaryColor : AppColors.tertiaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstants.image + upcoming.posterPath!),
              ),
            ),
          ),
          Positioned(
            right: Dimensions.width20,
            top: Dimensions.height15,
            child: FavoriteWidget(
              movie: upcoming,
            ),
          ),
        ],
      )
    );
  }
}
