import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/now_playing_controller.dart';
import '../../controller/upcoming_controller.dart';
import '../../models/movies_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/title_text_widget.dart';

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
        GetBuilder<UpcomingController>(builder: (data) {
          return data.isLoaded? SizedBox(
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
        // Get.toNamed(RouteHelper.getPopularFood(index, "home"));
      },
      child: Container(
        height: Dimensions.pageViewContainer,
        width: Dimensions.width40*3,
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.width10,
            vertical: Dimensions.height10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: index.isEven ? AppColors.secondColor : AppColors.thirdColor,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(AppConstants.image + upcoming.poster_path!),
          ),
        ),
      ),
    );
  }
}
