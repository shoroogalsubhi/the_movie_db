import 'package:flutter/material.dart';
import '../../controller/movies_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/general/no_data.dart';
import '../../widgets/general/title_text_widget.dart';
import 'package:get/get.dart';
import '../../widgets/images/build_image_item.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height100*2.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleTextWidget(text: "Upcoming"),
          GetBuilder<MoviesController>(builder: (data) {
            if(data.isLoadedUpcoming){
              return data.upcomingList.isNotEmpty? SizedBox(
                height: Dimensions.pageViewContainer,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.upcomingList.length,
                    itemBuilder: (context, position) {
                      return BuildImageItem(
                        index:position,
                        movie: data.upcomingList[position],
                        routerName: RouteHelper.moviesHome,
                      );
                    }),
              ): const NoData(text: "There are no upcoming movies");
            }else{
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
