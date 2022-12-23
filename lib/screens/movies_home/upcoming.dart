import 'package:flutter/material.dart';
import '../../controller/movies_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/title_text_widget.dart';
import 'package:get/get.dart';
import 'build_page_item.dart';

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
            return data.isLoadedUpcoming? SizedBox(
              height: Dimensions.pageViewContainer,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.upcomingList.length,
                  itemBuilder: (context, position) {
                    return BuildPageItem(index: position, movie: data.upcomingList[position]);
                  }),
            ): const Center(
              child: CircularProgressIndicator(
                color: AppColors.whiteColor,
              ),
            );
          }),
        ],
      ),
    );
  }
}
